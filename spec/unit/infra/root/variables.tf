variable "region" {}

variable "group_name" {}
variable "group_members" {
  type = list(string)
  default = null
}
variable "group_policies" {
  type = list(string)
  default = null
}
