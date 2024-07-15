variable "ARM_SUBSCRIPTION_ID" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "ARM_CLIENT_ID" {
	description = "The client ID for Azure"
	type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "The client secret for Azure"
  type        = string
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  description = "Tenant ID for Azure"
  type        = string
}

variable "location" {
  description = "The Azure location for resources"
  type        = string
  default     = "centralus"
}