module "user_1" {
  source  = "infrablocks/user/aws"
  version = "0.0.1"

  user_name = var.user_1_name

  include_access_key = "no"
  include_login_profile = "no"
}

module "user_2" {
  source  = "infrablocks/user/aws"
  version = "0.0.1"

  user_name = var.user_2_name

  include_access_key = "no"
  include_login_profile = "no"
}

module "user_3" {
  source  = "infrablocks/user/aws"
  version = "0.0.1"

  user_name = var.user_3_name

  include_access_key = "no"
  include_login_profile = "no"
}
