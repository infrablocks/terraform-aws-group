resource "aws_iam_user" "user_1" {
  name = "user-1-${var.deployment_identifier}"
}

resource "aws_iam_user" "user_2" {
  name = "user-2-${var.deployment_identifier}"
}
