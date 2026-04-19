data "aws_availability_zones" "availability_zones" {
  state = "available"

  # すでに廃止になっているap-northeas-1bを除外
  exclude_names = [
    "ap-northeast-1b"
  ]
}

locals {
  # 利用可能かつ除外されていないアベイラビリティゾーンの数
  number_of_availability_zones = length(
    data.aws_availability_zones.availability_zones.names
  )
}