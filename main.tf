locals {
  cors_rule                 = var.cors_rule != null ? { create = true } : {}
  replication_configuration = var.replication_configuration != null ? { create = true } : {}
}

resource "aws_s3_bucket" "default" {
  bucket        = var.name
  acl           = var.acl
  force_destroy = var.force_destroy
  policy        = var.policy
  region        = var.region
  tags          = var.tags

  dynamic cors_rule {
    for_each = local.cors_rule

    content {
      allowed_headers = var.cors_rule.allowed_headers
      allowed_methods = var.cors_rule.allowed_methods
      allowed_origins = var.cors_rule.allowed_origins
      expose_headers  = var.cors_rule.expose_headers
      max_age_seconds = var.cors_rule.max_age_seconds
    }
  }

  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_id
        sse_algorithm     = var.kms_key_id != null ? "aws:kms" : "AES256"
      }
    }
  }

  dynamic lifecycle_rule {
    for_each = var.lifecycle_rule

    content {
      id                                     = lookup(lifecycle_rule.value, "id", null)
      prefix                                 = lookup(lifecycle_rule.value, "prefix", null)
      tags                                   = lookup(lifecycle_rule.value, "tags", null)
      abort_incomplete_multipart_upload_days = lookup(lifecycle_rule.value, "abort_incomplete_multipart_upload_days", null)
      enabled                                = lifecycle_rule.value.enabled

      # Max 1 block - expiration
      dynamic expiration {
        for_each = length(keys(lookup(lifecycle_rule.value, "expiration", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "expiration", {})]

        content {
          date                         = lookup(expiration.value, "date", null)
          days                         = lookup(expiration.value, "days", null)
          expired_object_delete_marker = lookup(expiration.value, "expired_object_delete_marker", null)
        }
      }

      # Several blocks - transition
      dynamic transition {
        for_each = lookup(lifecycle_rule.value, "transition", [])

        content {
          date          = lookup(transition.value, "date", null)
          days          = lookup(transition.value, "days", null)
          storage_class = transition.value.storage_class
        }
      }

      # Max 1 block - noncurrent_version_expiration
      dynamic noncurrent_version_expiration {
        for_each = length(keys(lookup(lifecycle_rule.value, "noncurrent_version_expiration", {}))) == 0 ? [] : [lookup(lifecycle_rule.value, "noncurrent_version_expiration", {})]

        content {
          days = lookup(noncurrent_version_expiration.value, "days", null)
        }
      }

      # Several blocks - noncurrent_version_transition
      dynamic noncurrent_version_transition {
        for_each = lookup(lifecycle_rule.value, "noncurrent_version_transition", [])

        content {
          days          = lookup(noncurrent_version_transition.value, "days", null)
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }
    }
  }

  dynamic replication_configuration {
    for_each = local.replication_configuration

    content {
      role = var.replication_configuration.iam_role_arn

      rules {
        id     = var.replication_configuration.rule_id
        status = "Enabled"

        destination {
          bucket        = var.replication_configuration.dest_bucket
          storage_class = var.replication_configuration.dest_storage_class
        }
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket                  = aws_s3_bucket.default.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
