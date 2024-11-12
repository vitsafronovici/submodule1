provider "aws" {
  region                   = "us-east-1"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0305d0b03812a425e"
    instance_type = "t2.micro"
    tags = {
      Name = "submodule1"
    }
}

terraform {
    backend "s3" {
        bucket = "vit-s3-bucket"
        key    = "vit/terraform/remote/s3/terraform.tfstate"
        region     = "us-east-1"
        dynamodb_table = "vit-lock"
    }
}

