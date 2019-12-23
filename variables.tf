variable "name" {
  type        = string
  description = "The name of the bucket"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "The canned ACL to apply, defaults to `private`"
}

variable "block_public_acls" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should block public ACLs for this bucket"
}

variable "block_public_policy" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
}

variable "cors_rule" {
  type = object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  })
  default     = null
  description = "The CORS rule for the S3 bucket"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "A boolean that indicates all objects should be deleted when deleting the bucket"
}

variable "ignore_public_acls" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should ignore public ACLs for this bucket"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used for the bucket encryption"
}

variable "lifecycle_rule" {
  type        = any
  default     = []
  description = "List of maps containing lifecycle management configuration settings"
}

variable "region" {
  type        = string
  default     = null
  description = "The region this bucket should reside in, defaults to the region used by the callee"
}

variable "replication_configuration" {
  type = object({
    iam_role_arn       = string
    dest_bucket        = string
    dest_storage_class = string
    rule_id            = string
  })
  default     = null
  description = "Bucket replication configuration settings"
}

variable "restrict_public_buckets" {
  type        = bool
  default     = true
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
}

variable "policy" {
  type        = string
  default     = null
  description = "A valid bucket policy JSON document"
}

variable "versioning" {
  type        = bool
  default     = false
  description = "Versioning is a means of keeping multiple variants of an object in the same bucket"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the bucket"
}
