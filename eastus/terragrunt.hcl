remote_state {
  backend = "local"  # Or switch to "s3" for production use
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
    region = "us-east-1"
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}
EOF
}

inputs = {
  aws_access_key = getenv("AWS_ACCESS_KEY_ID")
  aws_secret_key = getenv("AWS_SECRET_ACCESS_KEY")
}
