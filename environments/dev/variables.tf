variable "prefix" {
  type        = string
  description = "Prefix used for naming all resources"
  default     = "proj"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., dev, stage, prod)"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources into"
  default     = "eastus"
}

variable "tags" {
  type = map(string)
  description = "Common tags to apply to resources"
  default = {
    environment = "dev"
    owner       = "devops-team"
    project     = "azure-infra"
  }
}
