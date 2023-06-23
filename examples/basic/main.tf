provider "aws" {
  region = "eu-west-1"
}

resource "random_pet" "default" {
  length = 8
}

module "log_bucket" {
  source = "../.."

  name       = "logs-${random_pet.default.id}"
  versioning = true

  lifecycle_rule = [
    {
      id      = "retention"
      enabled = true

      abort_incomplete_multipart_upload = {
        days_after_initiation = 7
      }

      noncurrent_version_expiration = {
        noncurrent_days = 90
      }

      noncurrent_version_transition = {
        noncurrent_days = 14
        storage_class   = "ONEZONE_IA"
      }
    }
  ]
}
