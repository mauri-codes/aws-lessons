variable "subnet_config" {
  type = map(object({
    az = string
    cidr = string
  }))
}
variable "vpc_name" {
  type = string
}