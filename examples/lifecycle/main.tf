provider "aws" {
  region = "eu-west-1"
}

module "lifecycle" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "lifecycle"

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
}

module "lifecycle_multiple" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "lifecycle-multiple"

  lifecycle_rule = [
    {
      id      = "ClassADocRule"
      enabled = true

      filter = {
        prefix = "classA/"
      }

      transition = [
        {
          days          = 365
          storage_class = "GLACIER"
        }
      ]

      expiration = {
        days = 365
      }
    },
    {
      id      = "ClassBDocRule"
      enabled = true

      filter = {
        prefix = "classB/"
      }

      transition = [
        {
          days          = 90
          storage_class = "STANDARD_IA"
        }
      ]

      expiration = {
        days = 365
      }
    }
  ]
}

module "lifecycle_complex_filter" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "lifecycle-complex-filter"

  lifecycle_rule = [
    {
      id      = "TransitionWithAPrefixAndBasedOnSize"
      enabled = true

      filter = {
        and = {
          prefix                   = "tax/"
          object_size_greater_than = 500
        }
      }

      transition = [
        {
          days          = 365
          storage_class = "GLACIER"
        }
      ]
    }
  ]
}
