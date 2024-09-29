variable "project_name" {
  type        = string
  default     = "vault-engines-dynamic-aws"
  description = "Name of the project using this module"
}

variable "resource_tags" {
  description = "List of resource tags to be added to all created resources"
  type        = map(string)
  default = {
    Managed_by = "terraform"
    Project    = "vault"
  }
}

variable "provider_aws" {
  description = "Configuration passed to the Hashicorp/aws provider"
  default     = {}
  type = object({
    region = optional(string, "eu-west-1")
  })
}

variable "s3_config" {
  type = object({
    bucket           = optional(string) #, "vault-engine-dynamic-aws")
    enable_logging   = optional(bool, false)
    force_destroy    = optional(bool, true)
    object_ownership = optional(string, "BucketOwnerPreferred")
  })
  description = "Configure which child-resources will be created for the S3 bucket"
  default     = {}
}

variable "ddb_global" {
  type = object({
    append_random_id = optional(bool, true)
    enable_policy    = optional(bool, false)
  })
  default = {}
}

variable "ddb_config" {
  default = {}
  type = object({
    name = optional(string) #, "vault-engine-dynamic-aws-terraform-lock")
    sse  = optional(bool, true)
    rcu  = optional(number, 5)
    wcu  = optional(number, 5)
  })
}

