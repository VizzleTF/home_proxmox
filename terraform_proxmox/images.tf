# resource "proxmox_virtual_environment_file" "ubuntu2404_cloud_image" {
#   content_type = "iso"
#   datastore_id = "local"
#   node_name    = "pve2"

#   source_file {
#     path = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
#   }
# }

resource "proxmox_virtual_environment_download_file" "pve2_fedora_coreos_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve2"
  url          = "https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/39.20240128.3.0/x86_64/fedora-coreos-39.20240128.3.0-live.x86_64.iso"
  file_name    = "fedora_core_os39.img"
}

resource "proxmox_virtual_environment_download_file" "home_fedora_coreos_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "home"
  url          = "https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/39.20240128.3.0/x86_64/fedora-coreos-39.20240128.3.0-live.x86_64.iso"
  file_name    = "fedora_core_os39.img"
}

resource "proxmox_virtual_environment_download_file" "fedora_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve2"
  url          = "https://download.fedoraproject.org/pub/fedora/linux/releases/39/Cloud/x86_64/images/Fedora-Cloud-Base-39-1.5.x86_64.qcow2"
  file_name    = "fedora39.img"
}


resource "proxmox_virtual_environment_download_file" "oracle_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve2"
  url          = "https://yum.oracle.com/templates/OracleLinux/OL9/u3/x86_64/OL9U3_x86_64-kvm-b211.qcow"
  file_name    = "oracle93.img"
}

resource "proxmox_virtual_environment_file" "pbs_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "home"

  source_file {
    path = "https://enterprise.proxmox.com/iso/proxmox-backup-server_3.1-1.iso"
  }
}
