variable "bucket_name" {
  type = string
}
variable "group_name" {
  type    = string
  default = "test_group"
}
variable "user_name" {
  type    = string
  default = "test_user"
}
variable "action_list" {
  type = list(string)
}