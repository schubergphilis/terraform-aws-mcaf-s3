locals {
  cors_rule = var.cors_rule != null ? { create = true } : {}
}

resource aws_s3_bucket default {
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
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
}

resource aws_s3_bucket_public_access_block default {
  bucket = aws_s3_bucket.default.id

  block_public_acls       = ! var.public_access
  block_public_policy     = ! var.public_access
  ignore_public_acls      = ! var.public_access
  restrict_public_buckets = ! var.public_access
}
