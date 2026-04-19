# パブリックサブネット用のルートテーブル
resource "aws_route_table" "public_route_tables" {
  for_each = aws_subnet.public_subnet
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.service_name}-${var.env}-${each.value.availability_zone}-public-route-table"
    AvailabilityZone = each.value.availability_zone
    Scope = "public"
  }
}

# パブリックサブネットのデフォルトルート
resource "aws_route" "public_default_route" {
  for_each = aws_subnet.public_subnet
  route_table_id = aws_route_table.public_route_tables[each.key].id
  
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

# パブリックサブネットとパブリックサブネット用のルートテーブルの紐付け
resource "aws_route_table_association" "public_subnet_route_table_association" {
  for_each = aws_subnet.public_subnet
  route_table_id = aws_route_table.public_route_tables[each.key].id
  subnet_id = each.value.id
}

# プライベートサブネット用のルートテーブル
resource "aws_route_table" "private_route_tables" {
  for_each = aws_subnet.private_subnet
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.service_name}-${var.env}-${each.value.availability_zone}-private-route-table"
    AvailabilityZone = each.value.availability_zone
    Scope = "private"
  }
}

# プライベートサブネットとプライベートサブネット用のルートテーブルの紐付け
resource "aws_route_table_association" "private_subnet_route_table_association" {
  for_each = aws_subnet.private_subnet
  route_table_id = aws_route_table.private_route_tables[each.key].id
  subnet_id = each.value.id
}

# プライベートサブネットのデフォルトルート設定
resource "aws_route" "private_default_route" {
  for_each = aws_subnet.private_subnet
  route_table_id = aws_route_table.private_route_tables[each.key].id
  
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateways[each.value.availability_zone].id
}