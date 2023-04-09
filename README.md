# PROXMOX VM

Module for create a custom VM with Proxmox

## Example

````
module "docker-server-01" {
  source              = "git@github.com:frost-warden-00/terraform-proxmox-vm.git?ref=v1"

  ssh_key          = "ssh-rsa key-id name@github"
  hostname         = "random-name"
  vm_name          = "name-of-vm"
  target_node      = "name-of-node"
  template_source  = "template-ubuntu-2204"
  full_clone       = true
  static_ip        = "ip=xxx.xxx.xx.xxx/24,gw=xxx.xxx.xx.1"
  dns_ip           = "xxx.xxx.xxx.1"
  user_cloud_init  = "random-user"
  memory_size      = 4096
  cores            = 4
  agent_enabled    = 1
  size_disk        = "48G"
  storage_location = "local-lvm"
  onboot           = true
  hypervisor_ip    = "xxx.xxx.xxx.xxx"
}
````



## Getting started



<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.6 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.cloud_init_copy](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.copy_cloud_init](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [proxmox_vm_qemu.vm](https://registry.terraform.io/providers/Telmate/proxmox/2.9.6/docs/resources/vm_qemu) | resource |
| [template_file.cloud_init_root](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agent_enabled"></a> [agent\_enabled](#input\_agent\_enabled) | Enable QEMU Guest Agent. | `number` | n/a | yes |
| <a name="input_balloon"></a> [balloon](#input\_balloon) | Minimum memory | `number` | `0` | no |
| <a name="input_cores"></a> [cores](#input\_cores) | Number of cores to assign to the VM. | `number` | n/a | yes |
| <a name="input_dns_ip"></a> [dns\_ip](#input\_dns\_ip) | IP of the DNS to use for the VM. | `string` | n/a | yes |
| <a name="input_full_clone"></a> [full\_clone](#input\_full\_clone) | You want to make a full clone of the custom template? | `bool` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname | `string` | n/a | yes |
| <a name="input_hypervisor_ip"></a> [hypervisor\_ip](#input\_hypervisor\_ip) | Hypervisor IP | `string` | n/a | yes |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | RAM to use. | `number` | n/a | yes |
| <a name="input_onboot"></a> [onboot](#input\_onboot) | Should the VM start when Proxmox is restarted/power off? | `bool` | `false` | no |
| <a name="input_size_disk"></a> [size\_disk](#input\_size\_disk) | Size in M/G | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | SSH key to allow access to VM | `string` | n/a | yes |
| <a name="input_static_ip"></a> [static\_ip](#input\_static\_ip) | Static IP to use | `string` | n/a | yes |
| <a name="input_storage_location"></a> [storage\_location](#input\_storage\_location) | Name of the Block level storage | `string` | n/a | yes |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | NAme of the target node where we will deploy the VM | `string` | n/a | yes |
| <a name="input_template_source"></a> [template\_source](#input\_template\_source) | Name of the custom template | `string` | n/a | yes |
| <a name="input_user_cloud_init"></a> [user\_cloud\_init](#input\_user\_cloud\_init) | Name of the user to use (Custom template already has a fixed user) | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the VM | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
