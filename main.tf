provider "aws" {
  region = var.aws_region
}

module "gateway_instance" {
  source                  = "../terraform-aws-modules/compute"
  ami_id                  = var.ami_id
  gw_location             = var.gw_location
  customer_name           = var.customer_name
  key_name                = var.key_name
  internet_subnet         = var.internet_subnet
  mpls_subnet             = var.mpls_subnet
  lan_if_enable           = var.lan_if_enable
  lan_subnet              = var.lan_subnet
  security_group_internet = var.security_group_internet
  security_group_mpls     = var.security_group_mpls
  security_group_lan      = var.security_group_lan
  user_data_file          = "./bootstrap/ciscosdwan.cfg"
}