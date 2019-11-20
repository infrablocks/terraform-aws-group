data "terraform_remote_state" "prerequisites" {
  backend = "local"

  config = {
    path = "${path.module}/../../../../state/prerequisites.tfstate"
  }
}

module "group" {
  source = "../../../../"

  group_name = var.group_name
  group_members = [
    data.terraform_remote_state.prerequisites.outputs.user_1_arn,
    data.terraform_remote_state.prerequisites.outputs.user_2_arn,
    data.terraform_remote_state.prerequisites.outputs.user_3_arn
  ]
}
