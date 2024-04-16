module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.vpc.public_subnet_id
  ami_id = "ami-0f7204385566b32d0" 
  instance_type = "t2.micro"
  security_group_id   = module.vpc.web_sg_id
}
