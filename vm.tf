
#Cloud Init Config file
data "template_file" "cloud_init_root" {
  template = fileexists("./template/cloud_init.cloud_config") ? file("./template/cloud_init.cloud_config") : file("${path.module}/template/module_config.cloud_config")

  vars = {
    ssh_key  = var.ssh_key
    hostname = var.hostname
  }
}

# Create a local copy of the file, to transfer to Proxmox
resource "local_file" "cloud_init_copy" {
  content  = data.template_file.cloud_init_root.rendered
  filename = "./template/${var.hostname}.cfg"
}

# Transfer the file to the Proxmox Host
resource "null_resource" "copy_cloud_init" {
  connection {
    type        = "ssh"
    user        = "random_user" # change or create a variable user
    private_key = file("~/.ssh/pemfile")
    host        = var.hypervisor_ip
  }

  provisioner "file" {
    source      = local_file.cloud_init_copy.filename
    destination = "/var/lib/vz/snippets/${var.hostname}.yml"
  }
}

resource "proxmox_vm_qemu" "vm" {
  ## Wait for the cloud-config file to exist
  depends_on = [
    null_resource.copy_cloud_init,
  ]

  name        = var.vm_name
  target_node = var.target_node
  onboot      = var.onboot


  # Clone from custom template
  clone      = var.template_source
  full_clone = var.full_clone
  os_type    = "cloud-init"

  # Cloud init options
  cicustom                = "user=local:snippets/${var.hostname}.yml"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0               = var.static_ip
  nameserver              = var.dns_ip
  ciuser                  = var.user_cloud_init

  memory  = var.memory_size
  balloon = var.balloon
  sockets = 1
  cores   = var.cores
  agent   = var.agent_enabled

  bootdisk = "scsi0"
  scsihw   = "virtio-scsi-pci"

  disk {
    size    = var.size_disk
    type    = "scsi"
    storage = var.storage_location
  }

  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Ignore changes to the network
  ## MAC address is generated on every apply, causing
  ## TF to think this needs to be rebuilt on every apply
  lifecycle {
    ignore_changes = [
      network
    ]
  }
}
