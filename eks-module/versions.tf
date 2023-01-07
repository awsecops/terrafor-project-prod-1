# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.63"
     }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-eks-netflixs"
    key    = "prod/eks-cluster/terraform.tfstate"
    region = "us-east-1" 
 
    # For State Locking
    dynamodb_table = "prod-ekscluster"    
  }  
}

# Terraform Provider Block
provider "aws" {
  profile = "default"
  region = var.aws_region
}