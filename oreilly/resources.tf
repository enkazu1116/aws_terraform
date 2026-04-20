module "vpc" {
  source         = "./modules/vpc"
  service_name   = "sample"
  vpc_name       = "sample-vpc"
  subnet_cidrs = {
    public = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  }
  env            = terraform.workspace
  vpc_cidr_block = "10.0.0.0/16"
  vpc_additional_tags = {
    Usage = "sample vpc explanation"
  }
}

module "ecs_cluster" {
  source = "./modules/ecs"
  service_name = "sample"
  env = terraform.workspace
}