data "terraform_remote_state" "prerequisites" {
  backend = "local"

  config = {
    path = "${path.module}/../../../../state/prerequisites.tfstate"
  }
}

module "group" {
  # This makes absolutely no sense. I think there's a bug in terraform.
  source = "./../../../../../../../"

  group_name = var.group_name
  group_policies = var.group_policies
  group_members = [
    data.terraform_remote_state.prerequisites.outputs.user_1_name,
    data.terraform_remote_state.prerequisites.outputs.user_2_name,
    data.terraform_remote_state.prerequisites.outputs.user_3_name
  ]
}
