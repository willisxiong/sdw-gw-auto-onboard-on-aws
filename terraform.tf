terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73"
    }
  }

  backend "s3" {
    bucket         = "cmi-sdw-tfstate"
    key            = "state/compute/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-state-lockid"
    encrypt        = true
  }
}