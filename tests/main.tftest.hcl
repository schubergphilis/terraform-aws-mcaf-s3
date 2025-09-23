# Mock aws provider, otherwise Terraform tries to connect to the service API.
mock_provider "aws" {
  # Mock data.aws_region: we always want to return "eu-central-1" for our tests.
  mock_data "aws_region" {
    defaults = {
      region = "eu-central-1"
    }
  }
}

run "setup" {
  module {
    source = "./tests/setup"
  }
}

# The default test checks logic in module when using it's default values when creating a plan.
# Additional tests below check individual variables and changes to their defaults. Try not to
# create assertions for resource fields that reference just the variable.
run "default" {
  command = plan

  module {
    source = "./"
  }

  assert {
    condition     = aws_s3_bucket.default.region == "eu-central-1"
    error_message = "Expected S3 bucket region to be eu-central-1, got: ${aws_s3_bucket.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_ownership_controls.default.region == "eu-central-1"
    error_message = "Expected S3 bucket ownership controls region to be eu-central-1, got: ${aws_s3_bucket_ownership_controls.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_policy.default.region == "eu-central-1"
    error_message = "Expected S3 bucket policy region to be eu-central-1, got: ${aws_s3_bucket_policy.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.default.region == "eu-central-1"
    error_message = "Expected S3 bucket public access block region to be eu-central-1, got: ${aws_s3_bucket_public_access_block.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_request_payment_configuration.default.region == "eu-central-1"
    error_message = "Expected S3 bucket request payment configuration region to be eu-central-1, got: ${aws_s3_bucket_request_payment_configuration.default.region}"
  }
}

# Test resources use the supplied region value.
# Without a specified region they should fall back to the aws_region data source (tested in default
# test).
run "region" {
  command = plan

  module {
    source = "./"
  }

  variables {
    region = "eu-west-1"
  }

  assert {
    condition     = aws_s3_bucket.default.region == "eu-west-1"
    error_message = "Expected S3 bucket region to be eu-west-1, got: ${aws_s3_bucket.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_ownership_controls.default.region == "eu-west-1"
    error_message = "Expected S3 bucket ownership controls region to be eu-west-1, got: ${aws_s3_bucket_ownership_controls.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_policy.default.region == "eu-west-1"
    error_message = "Expected S3 bucket policy region to be eu-west-1, got: ${aws_s3_bucket_policy.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.default.region == "eu-west-1"
    error_message = "Expected S3 bucket public access block region to be eu-west-1, got: ${aws_s3_bucket_public_access_block.default.region}"
  }

  assert {
    condition     = aws_s3_bucket_request_payment_configuration.default.region == "eu-west-1"
    error_message = "Expected S3 bucket request payment configuration region to be eu-west-1, got: ${aws_s3_bucket_request_payment_configuration.default.region}"
  }
}
