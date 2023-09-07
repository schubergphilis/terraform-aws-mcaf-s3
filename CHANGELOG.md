# Changelog

All notable changes to this project will automatically be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
