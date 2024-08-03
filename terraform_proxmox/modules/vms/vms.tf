terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}

resource "proxmox_virtual_environment_vm" "vm" {
  name       = var.vm_name
  tags       = var.tags
  node_name  = var.node_name
  vm_id      = var.vm_id
  boot_order = ["sata0"]

  agent { enabled = true }
  cpu {
    cores = var.cores
    type  = "host"
  }
  memory { dedicated = var.ram }
  startup {
    order    = "2"
    up_delay = "5"
  }
  disk {
    datastore_id = "local-lvm"
    file_id      = var.image_file
    interface    = "sata0"
    size         = var.disk_size
  }
  initialization {
    ip_config {
      ipv4 {
        address = var.address
        gateway = "10.11.12.1"
      }
    }
    user_account {
      keys     = [trimspace(var.home_pc_public_key)]
      password = var.vm_password
      username = "root"
    }
  }
  network_device { bridge = "vmbr0" }
  operating_system { type = "l26" }
}
