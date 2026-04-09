# データソース aws_availability_zonesで利用可能なAZの名前を取得
data "aws_availability_zones" "current" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  name = "${var.stage}-vpc-tf"
  cidr = var.vpc_cidr

  # azsはリソースを配置するAZを指定する。
  azs = slice(data.aws_availability_zones.current.names, 0, 3)
  
  # public_subnets
  public_subnets = [
    cidrsubnet(var.vpc_cidr, 4, 0),
    cidrsubnet(var.vpc_cidr, 4, 1),
    cidrsubnet(var.vpc_cidr, 4, 2)
  ]

  # private_subnets(NAT Gatewayへのルートなし)
  intra_subnets = [
    cidrsubnet(var.vpc_cidr, 4, 4),
    cidrsubnet(var.vpc_cidr, 4, 5),
    cidrsubnet(var.vpc_cidr, 4, 6)
  ]

  # private_subnets(NAT Gatewayへのルートあり)
  private_subnets = var.enable_nat_gateway ? [
    cidrsubnet(var.vpc_cidr, 4, 8),
    cidrsubnet(var.vpc_cidr, 4, 9),
    cidrsubnet(var.vpc_cidr, 4, 10)
  ] : []

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = (
    var.enable_nat_gateway ? (var.one_nat_gateway_per_az ? false : true) : false
  )
  one_nat_gateway_per_az = (
    var.enable_nat_gateway ? var.one_nat_gateway_per_az : false
  )
}