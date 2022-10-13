data "terraform_remote_state" "prerequisites" {
  backend = "local"

  config = {
    path = "${path.module}/../../../../state/prerequisites.tfstate"
  }
}

module "group" {
  source = "../../../.."

  group_name = var.group_name
  group_members = var.group_members
  group_policies = var.group_policies
}
