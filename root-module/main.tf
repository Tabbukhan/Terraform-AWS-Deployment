provider "aws" {
  region = var.aws_region
}

module "ec2_instance" {
  source            = "../ec2-module"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  key_name          = var.key_name
  security_group_id = var.security_group_id
  instance_name     = var.instance_name
}

output "ec2_instance_ip" {
  value = module.ec2_instance.public_ip
}
