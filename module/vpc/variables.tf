variable "stage" {
  type = string
  description = "stage: dev, prd"
}

variable "vpc_cidr" {
    type = string
    description = "VPCのCIDRブロックを指定"
}

variable "enable_nat_gateway" {
    type = bool
    description = "NAT Gatewayを使うかどうか"
}

variable "one_nat_gateway_per_az" {
    type = bool
    default = false
    description = "AZごとに1つのNAT Gatewayを設置するかどうか"
}