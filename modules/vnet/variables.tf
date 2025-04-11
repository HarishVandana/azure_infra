variable "vnet_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "address_space" {
  type = list(string)
}
variable "subnets" {
  type = map(list(string))
}
variable "tags" {
  type = map(string)
}
