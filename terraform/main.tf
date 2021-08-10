terraform {
  required_version = "1.0.0"

  required_providers {
    aws = "3.53.0"
  }
}    

provider "aws" {
  region  = "ap-northeast-1"
}

data "aws_iam_policy_document" "glue_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "glue_policy_document" {
  statement {
    actions   = ["s3:GetObject", "s3:PutObject","s3:DeleteObject"]
    resources = ["arn:aws:s3:::*"]
    effect    = "Allow"
  }
}
