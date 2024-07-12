variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "client_id" {
	description = "The client ID for Azure"
	type        = string
}

variable "client_secret" {
  description = "The client secret for Azure"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Tenant ID for Azure"
  type        = string
}

variable "location" {
  description = "The Azure location for resources"
  type        = string
  default     = "centralus"
}