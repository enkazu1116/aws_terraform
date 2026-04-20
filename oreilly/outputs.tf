output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_name" {
  value = module.vpc.vpc_name
}

output "ecs_cluster_name" {
  value = module.ecs_cluster.cluster_name
}

output "ecs_cluster_arn" {
  value = module.ecs_cluster.cluster_arn
}

output "cluster_name" {
    description = "作成されたクラスターの名前"
    value = module.ecs_cluster.cluster_name
}

output "cluster_arn" {
    description = "作成されたクラスターのARN"
    value = module.ecs_cluster.cluster_arn
}