terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = "flexcube"
  
  # Authentication can be provided using one of these methods:
  # 1. AWS CLI profile (profile = "default")
  # 2. Environment variables (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
  # 3. Shared credentials file (~/.aws/credentials)
  # 4. EC2 instance profile if running on AWS
}

