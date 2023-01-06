terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "test_policy"
  role = aws_iam_role.iam_for_lambda.id


  policy = "${file("iam/lambda_policy.json")}"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "test_role"

  assume_role_policy = "${file("iam/lambda_assume_policy.json")}"
}

locals{
    lambda_zip = "outputs/lambda_function.zip"
}

data "archive_file" "lambda_function" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "${local.lambda_zip}"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "${local.lambda_zip}"
  function_name = "final_function_1047"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"

  runtime = "python3.9"

}