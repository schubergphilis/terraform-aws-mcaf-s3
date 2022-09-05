# terraform-aws-mcaf-s3

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
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
| logging | Logging configuration, defaults to logging to the bucket itself | <pre>object({<br>    target_bucket = string<br>    target_prefix = string<br>  })</pre> | <pre>{<br>  "target_bucket": null,<br>  "target_prefix": "s3_access_logs/"<br>}</pre> | no |
| object\_ownership\_type | Type of object ownership within S3 bucket | `string` | `ObjectWriter` | no |
| object\_lock\_days | The number of days that you want to specify for the default retention period | `number` | `null` | no |
| object\_lock\_mode | The default object Lock retention mode to apply to new objects | `string` | `null` | no |
| object\_lock\_years | The number of years that you want to specify for the default retention period | `number` | `null` | no |
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
