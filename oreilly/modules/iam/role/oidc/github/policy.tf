resource "aws_iam_role_policy_attachment" "attachments" {
  for_each = toset(var.managed_iam_policy_arns)
  role = aws_iam_role.role.id
  policy_arn = each.value
}

resource "aws_iam_role_policy" "inline_policy" {
  for_each = var.inline_policy_documents
  name = each.key
  role = aws_iam_role.role.id
  policy = each.value
}