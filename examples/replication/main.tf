provider "aws" {
  region = "eu-west-1"
}

module "log_bucket" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "logs"

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

      noncurrent_version_transition = [
        {
          noncurrent_days = 30
          storage_class   = "ONEZONE_IA"
        }
      ]
    }
  ]

  replication_configuration = {
    iam_role_arn = "arn:aws:iam::111111111111:role/replication-role"

    rules = {
      "1" = {
        id                  = "1"
        dest_bucket         = "arn:aws:s3:::destination-bucket"
        dest_storage_class  = "STANDARD"
        replica_kms_key_arn = "arn:aws:kms:eu-west-1:111111111111:key/cfabdf0b-eb46-4e29-a38d-57a00ddxc0cc"

        source_selection_criteria = {
          replica_modifications     = true
          sse_kms_encrypted_objects = true
        }
      }
    }
  }
}
