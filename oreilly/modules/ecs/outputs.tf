output "cluster_name" {
  description = "作成されたECSクラスター名"
  value       = aws_ecs_cluster.ecs_cluster.name
}

output "cluster_arn" {
  description = "作成されたECSクラスターARN"
  value       = aws_ecs_cluster.ecs_cluster.arn
}
