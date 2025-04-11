variable "prefix" {
  type        = string
  description = "Prefix used for naming resources"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., dev, stage, prod)"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources into"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the VNET"
}

variable "tags" {
  type = map(string)
  description = "Tags to apply to resources"
}
