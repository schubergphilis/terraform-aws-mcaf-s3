provider "aws" {
  region = "eu-west-1"
}

module "logbucket" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "log"
  versioning  = false
}


module "bucket1" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "data1"
  versioning  = true

  logging = {
    target_bucket = module.logbucket.name
    target_prefix = "log/"
    target_object_key_format = {
      format_type           = "partitioned"
      partition_date_source = "DeliveryTime"
    }
  }
}


module "bucket2" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "data2"
  versioning  = true

  logging = {
    target_bucket = module.logbucket.name
    target_prefix = "log/"
    target_object_key_format = {
      format_type = "simple"
    }
  }
}
