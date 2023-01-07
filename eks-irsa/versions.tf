# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.70"
     }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-eks-netflixs"
    key    = "prod/eks-irsa/terraform.tfstate"
    region = "ap-south-1" 

    # For State Locking
    dynamodb_table = "prod-eks-irsa"    
  }     
}
