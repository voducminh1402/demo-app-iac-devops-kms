remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    path = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "aws" {
    region     = "us-east-1"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}
EOF
}

generate "variables" {
  path = "variables.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}
EOF
}

inputs = {
  aws_access_key = get_env("AWS_ACCESS_KEY_ID")
  aws_secret_key = get_env("AWS_SECRET_ACCESS_KEY")
}
