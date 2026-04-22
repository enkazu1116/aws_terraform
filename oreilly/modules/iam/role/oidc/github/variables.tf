variable "service_name" {
  description = "IAMロールが関連するサービス名"
  type = string
}

variable "env" {
  description = "環境識別子(dev, stg, prod)"
  type = string
}

variable "iam_role_additional_tags" {
  description = "IAMロールに付与するタグ名"
  type = map(string)
  default = {}
  validation {
    condition = length(setintersection(keys(var.iam_role_additional_tags),
    ["Env", "ServiceName"])) == 0
    error_message = "Key names, Env and ServiceName are reserved. Not allowed to use them."
  }
}

variable "github_oragnization_name" {
  type = string
}

variable "github_repository_name" {
  type = string
}

variable "managed_iam_policy_arns" {
  description = "AWSまたはユーザー管理IAMポリシーのARNのリスト"
  type = list(string)
  default = []
}

variable "inline_policy_documents" {
  description = "ロールに付与するインラインポリシー、ポリシー名をキー、ポリシードキュメントを値として渡す"
  type = map(string)
  default = {}
}