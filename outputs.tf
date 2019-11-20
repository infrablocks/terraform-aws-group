output "group_arn" {
  value = aws_iam_group.group.arn
  description = "The ARN of the created group."
}
