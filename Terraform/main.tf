module "ssh_keys" {
  source           = "./modules/ssh_keys"
  ssh_key_master   = var.ssh_key_master
  local_files_path = var.local_files_path
}

module "servers" {
  source       = "./modules/servers"
  image_name   = var.image_name
  server_type  = var.server_type
  location     = var.location
  ansible_path = var.ansible_path
  ssh_key_ids  = module.ssh_keys.ssh_key_ids
  depends_on   = [module.ssh_keys]
}

module "volume" {
  source     = "./modules/volume"
  depends_on = [module.servers]
}

module "Clickhouse" {
  source           = "./modules/Clickhouse"
  depends_on       = [module.volume]
  local_files_path = var.local_files_path
}
