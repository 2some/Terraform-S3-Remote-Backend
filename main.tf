module "vpc" {
  source      = "./modules/vpc"
  environment = "dev"
  vpc_cidr    = "10.0.0.0/16"
}
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
terraform {
  backend "s3" {
    bucket = "obinna-terraform-state-2026"
    key    = "terraform.tfstate"
    region = "eu-north-1"
    use_lockfile = true
  }
}
