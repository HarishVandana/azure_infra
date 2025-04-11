variable "prefix" {
  type        = string
  description = "Prefix for naming all resources (e.g., 'proj')"
  default     = "proj"
}

variable "env" {
  type        = string
  description = "Environment name (e.g., dev, qa, prod)"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region to deploy resources into"
  default     = "eastus"
}

variable "tags" {
  type = map(string)
  description = "Tags to apply to resources (e.g., environment, owner, project)"
  default = {
    environment = "dev"
    owner       = "devops-team"
    project     = "azure-infra"
  }
}
