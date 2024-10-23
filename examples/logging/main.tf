provider "aws" {
  region = "eu-west-1"
}

module "bucket1" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "data1"
  versioning  = true

  logging = {
    target_bucket = "mylogbucket"
    target_prefix = "log/"
    target_object_key_format = {
      partitioned_prefix = {
        partition_date_source = "DeliveryTime" # "EventTime"
      }
    }
  }
}


module "bucket2" {
  #checkov:skip=CKV_AWS_300: false positive https://github.com/bridgecrewio/checkov/issues/5363
  source = "../.."

  name_prefix = "data2"
  versioning  = true

  logging = {
    target_bucket = "mylogbucket"
    target_prefix = "log/"
    target_object_key_format = {
      simple_prefix = {}
    }
  }
}
