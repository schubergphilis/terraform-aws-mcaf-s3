resource aws_s3_bucket default {
  bucket        = var.name
  acl           = var.acl
  policy        = var.policy
  region        = var.region
  force_destroy = var.force_destroy
  tags          = var.tags
  cors_rule     = var.cors_rule

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
