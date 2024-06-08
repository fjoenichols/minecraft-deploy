resource "vultr_instance" "my_minecraft" {
  label = "minecraft"
  tags = ["minecraft"]
  hostname = "mc-0"
  plan        = "vc2-1c-2gb"
  region      = "dfw"
  os_id       = "2284"
  enable_ipv6 = true
  ssh_key_ids = var.SSH_UUIDS
}

