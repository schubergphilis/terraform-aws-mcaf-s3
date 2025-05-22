# Upgrading Notes

This document captures required refactoring on your part when upgrading to a module version that contains breaking changes.

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
