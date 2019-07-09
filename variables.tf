variable "name" {
  type        = string
  description = "The name of the bucket"
}

variable "stack" {
  type        = string
  description = "The stack name of the bucket"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "The canned ACL to apply, defaults to `private`"
}

variable "policy" {
  type        = string
  default     = ""
  description = "A valid bucket policy JSON document"
}

variable "region" {
  type        = string
  default     = ""
  description = "The AWS region this bucket should reside in, defaults to the region used by the callee"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "A boolean that indicates all objects should be deleted when deleting the bucket"
}

variable "versioning" {
  type        = bool
  default     = false
  description = "Versioning is a means of keeping multiple variants of an object in the same bucket"
}

variable "kms_key_id" {
  type        = string
  default     = ""
  description = "The AWS KMS key ID used for the `SSE-KMS` encryption"
}

variable "sse_algorithm" {
  type        = string
  default     = "aws:kms"
  description = "The server-side encryption algorithm to use, defaults to `aws:kms`"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the bucket"
}
