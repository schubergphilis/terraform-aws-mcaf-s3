# terraform-aws-mcaf-s3

Terraform module to create an AWS S3 Bucket.

IMPORTANT: We do not pin modules to versions in our examples. We highly recommend that in your code you pin the version to the exact version you are using so that your infrastructure remains stable.

## Server access logging

Server access logging provides detailed records for the requests that are made to a bucket and can useful in security and access audits. However logging to the same bucket is not recommended and is disabled using this module. See AWS' explanation here:

> [!IMPORTANT]
> Your target bucket should not have server access logging enabled. You can have logs delivered to any bucket that you own that is in the same Region as the source bucket, including the source bucket itself. However, this would cause an infinite loop of logs and is not recommended. For simpler log management, we recommend that you save access logs in a different bucket.
> Source: <https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html>


By default, there is no naming schema. The bucket logs are stored in the `var.logging.target_bucket` using the `var.logging.target_prefix` as prefix only. If you want to further control the log format, `var.logging.target_object_key_format` can be used. You have two options to control the format:

Simple prefix, which uses the following format for the log file `[Desttarget_prefixinationPrefix][YYYY]-[MM]-[DD]-[hh]-[mm]-[ss]-[UniqueString]`:

```hcl
    target_prefix = "log/"
    target_object_key_format = {
      format_type = "simple"
    }
```

Or partitioned prefix, which uses the following format for the log file with partitioned folders. `[target_prefix][SourceAccountId]/​[SourceRegion]/​[SourceBucket]/​[YYYY]/​[MM]/​[DD]/​[YYYY]-[MM]-[DD]-[hh]-[mm]-[ss]-[UniqueString]`

```hcl
    target_prefix = "log/"
    target_object_key_format = {
      format_type           = "partitioned"
      partition_date_source = "EventTime" # DeliveryTime is default
    }
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_inventory.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_inventory) | resource |
| [aws_s3_bucket_lifecycle_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_notification.eventbridge](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_object_lock_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration) | resource |
| [aws_s3_bucket_ownership_controls.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_replication_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_iam_policy_document.combined](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.logging_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssl_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply, defaults to `private`. | `string` | `"private"` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | The CORS rule for the S3 bucket | <pre>object({<br/>    allowed_headers = list(string)<br/>    allowed_methods = list(string)<br/>    allowed_origins = list(string)<br/>    expose_headers  = list(string)<br/>    max_age_seconds = number<br/>  })</pre> | `null` | no |
| <a name="input_eventbridge_enabled"></a> [eventbridge\_enabled](#input\_eventbridge\_enabled) | Whether to enable Amazon EventBridge notifications. | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | A boolean that indicates all objects should be deleted when deleting the bucket. | `bool` | `false` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_inventory_configuration"></a> [inventory\_configuration](#input\_inventory\_configuration) | Bucket inventory configuration settings | <pre>map(object({<br/>    enabled                  = optional(bool, true)<br/>    filter_prefix            = optional(string, null)<br/>    frequency                = optional(string, "Weekly")<br/>    included_object_versions = optional(string, "Current")<br/>    optional_fields          = optional(list(string), null)<br/><br/>    destination = object({<br/>      account_id = string<br/>      bucket_arn = string<br/>      format     = optional(string, "Parquet")<br/>      prefix     = optional(string, null)<br/><br/>      encryption = optional(object({<br/>        encryption_type = string<br/>        kms_key_id      = optional(string, null)<br/>        }), {<br/>        encryption_type = "sse_s3"<br/>      })<br/>    })<br/>  }))</pre> | `{}` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The KMS key ARN used for the bucket encryption. | `string` | `null` | no |
| <a name="input_lifecycle_rule"></a> [lifecycle\_rule](#input\_lifecycle\_rule) | List of lifecycle configuration settings. | <pre>list(object({<br/>    id      = string<br/>    enabled = optional(bool, true)<br/><br/>    abort_incomplete_multipart_upload = optional(object({<br/>      days_after_initiation = number<br/>    }))<br/><br/>    expiration = optional(object({<br/>      date                         = optional(string)<br/>      days                         = optional(number)<br/>      expired_object_delete_marker = optional(bool)<br/>    }))<br/><br/>    filter = optional(object({<br/>      prefix                   = optional(string, "")<br/>      object_size_greater_than = optional(number)<br/>      object_size_less_than    = optional(number)<br/><br/>      tag = optional(object({<br/>        key   = string<br/>        value = string<br/>      }))<br/><br/>      # 'and' block for combining multiple predicates<br/>      and = optional(object({<br/>        object_size_greater_than = optional(number)<br/>        object_size_less_than    = optional(number)<br/>        prefix                   = optional(string, "")<br/>        tags                     = optional(map(string))<br/>      }))<br/>    }))<br/><br/>    noncurrent_version_expiration = optional(object({<br/>      newer_noncurrent_versions = optional(number)<br/>      noncurrent_days           = optional(number)<br/>    }))<br/><br/>    noncurrent_version_transition = optional(list(object({<br/>      newer_noncurrent_versions = optional(number)<br/>      noncurrent_days           = optional(number)<br/>      storage_class             = string<br/>    })))<br/><br/>    transition = optional(list(object({<br/>      date          = optional(string)<br/>      days          = optional(number)<br/>      storage_class = string<br/>    })))<br/>  }))</pre> | `[]` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Logging configuration, logging is disabled by default. | <pre>object({<br/>    target_bucket = string<br/>    target_prefix = string<br/>    target_object_key_format = optional(object({<br/>      format_type           = optional(string)                 # "simple" or "partitioned"<br/>      partition_date_source = optional(string, "DeliveryTime") # Required if format_type is "partitioned", default is DeliveryTime<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_logging_source_bucket_arns"></a> [logging\_source\_bucket\_arns](#input\_logging\_source\_bucket\_arns) | Configures which source buckets are allowed to log to this bucket. | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The Name of the bucket. If omitted, Terraform will assign a random, unique name. Conflicts with `name_prefix`. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with `name`. | `string` | `null` | no |
| <a name="input_object_lock_days"></a> [object\_lock\_days](#input\_object\_lock\_days) | The number of days that you want to specify for the default retention period. | `number` | `null` | no |
| <a name="input_object_lock_mode"></a> [object\_lock\_mode](#input\_object\_lock\_mode) | The default object Lock retention mode to apply to new objects. | `string` | `null` | no |
| <a name="input_object_lock_years"></a> [object\_lock\_years](#input\_object\_lock\_years) | The number of years that you want to specify for the default retention period. | `number` | `null` | no |
| <a name="input_object_ownership_type"></a> [object\_ownership\_type](#input\_object\_ownership\_type) | The object ownership type for the objects in S3 Bucket, defaults to BucketOwnerEnforced. | `string` | `"BucketOwnerEnforced"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | A valid bucket policy JSON document. | `string` | `null` | no |
| <a name="input_replication_configuration"></a> [replication\_configuration](#input\_replication\_configuration) | Bucket replication configuration settings, specify the rules map keys as integers as these are used to determine the priority of the rules in case of conflict. | <pre>object({<br/>    iam_role_arn = string<br/>    rules = map(object({<br/>      id                  = string<br/>      dest_bucket         = string<br/>      dest_storage_class  = optional(string, null)<br/>      replica_kms_key_arn = optional(string, null)<br/><br/>      source_selection_criteria = optional(object({<br/>        replica_modifications     = optional(bool, false)<br/>        sse_kms_encrypted_objects = optional(bool, false)<br/>      }))<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the bucket. | `map(string)` | `{}` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Versioning is a means of keeping multiple variants of an object in the same bucket. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the bucket |
| <a name="output_id"></a> [id](#output\_id) | Name of the bucket |
| <a name="output_name"></a> [name](#output\_name) | Name of the bucket |
<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0. See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-s3/blob/master/LICENSE) for full details.
