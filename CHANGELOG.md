# Changelog

All notable changes to this project will automatically be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v0.14.1 - 2024-08-05

### What's Changed

#### 🐛 Bug Fixes

* fix(output): Add `id` output to be compatible with s3 bucket data resource (#44) @shoekstra

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.14.0...v0.14.1

## v0.14.0 - 2024-05-14

### What's Changed

#### 🚀 Features

* feature: Adding replication kms for destination bucket, including source selection criteria (#43) @svashisht03

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.13.1...v0.14.0

## v0.13.1 - 2024-03-15

### What's Changed

#### 🐛 Bug Fixes

* bug: aws_s3_bucket_inventory always create a change when filter is ab… (#41) @skesarkar-schubergphilis

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.13.0...v0.13.1

## v0.13.0 - 2024-03-07

### What's Changed

#### 🚀 Features

* feature: add support for bucket inventory configuration (#40) @skesarkar-schubergphilis

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.12.1...v0.13.0

## v0.12.1 - 2024-01-02

### What's Changed

#### 🐛 Bug Fixes

* bug: reference bucket output instead of the name to solve referencing issues with bucket prefix (#38) @marwinbaumannsbp

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.12.0...v0.12.1

## v0.12.0 - 2024-01-02

### What's Changed

#### 🚀 Features

* feature: add support to provide a prefix as name, add validation (#37) @marwinbaumannsbp

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.11.0...v0.12.0

## v0.11.0 - 2023-10-02

### What's Changed

#### 🚀 Features

- enhancement: remove logging in own bucket more explicitly (#36) @fatbasstard

#### 🐛 Bug Fixes

- enhancement: remove logging in own bucket more explicitly (#36) @fatbasstard

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.10.1...v0.11.0

## v0.10.1 - 2023-09-07

### What's Changed

#### 🐛 Bug Fixes

- fix: Fix error in ACL configuration (#35) @fatbasstard

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.10.0...v0.10.1

## v0.10.0 - 2023-07-21

### What's Changed

#### 🚀 Features

- feature: Add support for EventBridge notifications (#34) @fatbasstard

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.9.1...v0.10.0

## v0.9.1 - 2023-07-04

### What's Changed

#### 🐛 Bug Fixes

- fix: Error "Number of distinct destination bucket ARNs cannot exceed 1" by adding required properties to rule block to have it parsed as XML schema V2 (#33) @stefanwb

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.9.0...v0.9.1

## v0.9.0 - 2023-06-27

### What's Changed

#### 🚀 Features

- feat: Changes replication_configuration variable so it supports multiple rules (#31) @stefanwb

**Full Changelog**: https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.8.0...v0.9.0

## v0.8.0 - 2023-06-23

### What's Changed

#### 🚀 Feature

- improvement: Update and simplify aws_s3_bucket_ownership_controls (#26) @fatbasstard

**Full Changelog**: [https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.7.1...v0.8.0](https://github.com/schubergphilis/terraform-aws-mcaf-s3/compare/v0.7.1...v0.8.0)
