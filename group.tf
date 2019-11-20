resource "aws_iam_group" "group" {
  name = var.group_name
}

resource "aws_iam_group_membership" "group" {
  count = length(var.group_members) == 0 ? 0 : 1
  name = "${var.group_name}-membership"
  group = aws_iam_group.group.name
  users = var.group_members
}

resource "aws_iam_group_policy_attachment" "policies" {
  for_each = toset(var.group_policies)
  group = aws_iam_group.group.name
  policy_arn = each.value
}
