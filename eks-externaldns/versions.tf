# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.12"
     }
    helm = {
      source = "hashicorp/helm"
      #version = "2.5.1"
      version = "~> 2.5"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.11"
    }      
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-eks-netflixs"
    key    = "prod/aws-externaldns/terraform.tfstate"
    region = "ap-south-1" 

    # For State Locking
    dynamodb_table = "prod-aws-externaldns"    
  }     
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}
