provider "aws" {
  region = "eu-west-1"
}

module "basic" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "basic"
}
