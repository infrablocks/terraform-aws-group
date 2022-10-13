module "group" {
  source = "../../"

  group_name = "test-group-${var.deployment_identifier}"
  group_members = [
    aws_iam_user.user_1.name,
    aws_iam_user.user_2.name
  ]
  group_policies = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/job-function/Billing"
  ]
}
