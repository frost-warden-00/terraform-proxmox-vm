variable "ssh_key" {
  type        = string
  description = "SSH key to allow access to VM"
}
variable "hostname" {
  type        = string
  description = "Hostname"
}

variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "target_node" {
  type        = string
  description = "NAme of the target node where we will deploy the VM"
}

variable "template_source" {
  type        = string
  description = "Name of the custom template"
}

variable "full_clone" {
  type        = bool
  description = "You want to make a full clone of the custom template?"
}

variable "static_ip" {
  type        = string
  description = "Static IP to use"
}
variable "dns_ip" {
  type        = string
  description = "IP of the DNS to use for the VM."
}

variable "user_cloud_init" {
  type        = string
  description = "Name of the user to use (Custom template already has a fixed user)"
}

variable "memory_size" {
  type        = number
  description = "RAM to use."
}

variable "cores" {
  type        = number
  description = "Number of cores to assign to the VM."
}

variable "agent_enabled" {
  type        = number
  description = "Enable QEMU Guest Agent."
}

variable "size_disk" {
  type        = string
  description = "Size in M/G"
}

variable "storage_location" {
  type        = string
  description = "Name of the Block level storage"
}

variable "onboot" {
  default     = false
  type        = bool
  description = "Should the VM start when Proxmox is restarted/power off?"
}

variable "balloon" {
  default     = 0
  description = "Minimum memory"
  type        = number
}

variable "hypervisor_ip" {
  description = "Hypervisor IP"
  type        = string
}