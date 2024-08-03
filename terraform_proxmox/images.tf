
locals {
  images_config = yamldecode(file("./configs/images.yaml"))
  nodes = toset(["home", "pve3", "pve4", "pve5"])
}

module "images" {
  for_each = { for image in local.images_config.images : image.image_name => image }
  source = "./modules/images"

  nodes = local.nodes
  url          = each.value.image_url
  file_name    = "${each.value.image_name}.img"
}
