variable "name" {
  type        = string
  description = "Security Group name"
}

variable "description" {
  type        = string
  description = "Security Group description"
  default     = "HTTP Security Group"
}

variable "vpc_id" {
  type        = string
  description = "Target VPC ID"
}

variable "ingress_cidr_ipv4" {
  type        = string
  description = "IPv4 CIDR allowed to access port 80"
  default     = "0.0.0.0/0"
}

variable "tags" {
  type        = map(string)
  description = "Tags for Security Group"
  default     = {}
}
