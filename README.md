# terraform-aws-mcaf-s3

## Server access logging

Server access logging provides detailed records for the requests that are made to a bucket and can useful in security and access audits. However logging to the same bucket is not recommended and is disabled using this module. See AWS' explanation here:

> Your target bucket should not have server access logging enabled. You can have logs delivered to any bucket that you own that is in the same Region as the source bucket, including the source bucket itself. However, this would cause an infinite loop of logs and is not recommended. For simpler log management, we recommend that you save access logs in a different bucket.

Source: https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-server-access-logging.html



<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.2.0 |
| aws | >= 4.9.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.9.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the bucket | `string` | n/a | yes |
| tags | A mapping of tags to assign to the bucket | `map(string)` | n/a | yes |
| acl | The canned ACL to apply, defaults to `private` | `string` | `"private"` | no |
| block\_public\_acls | Whether Amazon S3 should block public ACLs for this bucket | `bool` | `true` | no |
| block\_public\_policy | Whether Amazon S3 should block public bucket policies for this bucket | `bool` | `true` | no |
| cors\_rule | The CORS rule for the S3 bucket | <pre>object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    expose_headers  = list(string)<br>    max_age_seconds = number<br>  })</pre> | `null` | no |
| force\_destroy | A boolean that indicates all objects should be deleted when deleting the bucket | `bool` | `false` | no |
| ignore\_public\_acls | Whether Amazon S3 should ignore public ACLs for this bucket | `bool` | `true` | no |
| kms\_key\_arn | The KMS key ARN used for the bucket encryption | `string` | `null` | no |
| lifecycle\_rule | List of maps containing lifecycle management configuration settings | `any` | `[]` | no |
| logging | Logging configuration, logging is disabled by default | <pre>object({<br>    target_bucket = string<br>    target_prefix = string<br>  })</pre> | <pre>{<br>  "target_bucket": null,<br>  "target_prefix": "s3_access_logs/"<br>}</pre> | no |
| logging\_source\_bucket\_arns | Configures which source buckets are allowed to log to this bucket. | `list(string)` | `[]` | no |
| object\_lock\_days | The number of days that you want to specify for the default retention period | `number` | `null` | no |
| object\_lock\_mode | The default object Lock retention mode to apply to new objects | `string` | `null` | no |
| object\_lock\_years | The number of years that you want to specify for the default retention period | `number` | `null` | no |
| object\_ownership\_type | The object ownership type for the objects in S3 Bucket, defaults to Object Writer | `string` | `"ObjectWriter"` | no |
| policy | A valid bucket policy JSON document | `string` | `null` | no |
| replication\_configuration | Bucket replication configuration settings | <pre>object({<br>    iam_role_arn       = string<br>    dest_bucket        = string<br>    dest_storage_class = string<br>    rule_id            = string<br>  })</pre> | `null` | no |
| restrict\_public\_buckets | Whether Amazon S3 should restrict public bucket policies for this bucket | `bool` | `true` | no |
| versioning | Versioning is a means of keeping multiple variants of an object in the same bucket | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | ARN of the bucket |
| name | Name of the bucket |

<!--- END_TF_DOCS --->
