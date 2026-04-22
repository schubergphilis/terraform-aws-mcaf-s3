# Upgrading Notes

This document captures required refactoring on your part when upgrading to a module version that contains breaking changes.

## Upgrading to v3.0.0

### Key Changes

- A new variable `blocked_encryption_types` has been added to control which encryption types are blocked for S3 bucket objects.
- Starting in March 2026, Amazon S3 automatically blocks SSE-C uploads for all new buckets. To align with this behaviour, the default value is set to `["SSE-C"]`.
- For existing buckets that previously had `blocked_encryption_types` set to `null` in the remote state, you will need to explicitly set `blocked_encryption_types = ["NONE"]` to preserve the previous behaviour.

#### Variables

The following variables have been added:

- `blocked_encryption_types`: defaults to `["SSE-C"]`

## Upgrading to v2.0.0

### Key Changes

- This module now requires a minimum AWS provider version of 6.0 to support the `region` parameter. If you are using multiple AWS provider blocks, please read [migrating from multiple provider configurations](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/enhanced-region-support#migrating-from-multiple-provider-configurations).

## Upgrading to v1.0.0

### Key Changes

- Versioning is now enabled by default to comply with [Security Hub control S3.14](https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-14).
- The variable `lifecycle_rule` has been updated from type `any` to `list(object)`, and support has been added for all possible `filter` options.

#### Variables

The following variables have been modified:

- `lifecycle_rule`:

  - `noncurrent_version_transition` has changed from `map` to `list(object)`
  - `transition` has changed from `map` to `list(object)`
  - `prefix` has been moved to `filter.prefix` to be able to support all filter options

- `versioning`: default value has changed from `false` to `true`
