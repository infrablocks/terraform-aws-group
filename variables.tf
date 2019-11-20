variable "group_name" {
  type = string
  description = "The name of the group to create."
}

variable "group_members" {
  type = list(string)
  default = []
  description = "The names of the users that should be members of the group."
}

variable "group_policies" {
  type = list(string)
  default = []
  description = "The ARNs of the policies to attach to the group."
}
