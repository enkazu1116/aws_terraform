output "security_group_id" {
  description = "Created Security Group ID"
  value       = aws_security_group.this.id
}

output "security_group_arn" {
  description = "Created Security Group ARN"
  value       = aws_security_group.this.arn
}
