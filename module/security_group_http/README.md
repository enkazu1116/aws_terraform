# security_group_http

HTTP(80) を受け付ける Security Group を作る再利用モジュールです。

## Inputs

- `name` (string, required)
- `vpc_id` (string, required)
- `description` (string, optional)
- `ingress_cidr_ipv4` (string, optional)
- `tags` (map(string), optional)

## Outputs

- `security_group_id`
- `security_group_arn`

## Usage

```hcl
module "web_sg" {
  source = "../../module/security_group_http"

  name              = "${var.stage}-web-sg"
  vpc_id            = module.vpc.vpc_id
  ingress_cidr_ipv4 = "0.0.0.0/0"
  tags = {
    Name = "${var.stage}-web-sg"
  }
}
```
