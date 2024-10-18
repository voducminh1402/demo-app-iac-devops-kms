terraform {
  source = "../../modules/ecr"
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  repository_name     = "ecr-dev-devops-kms"
  image_tag_mutability = "IMMUTABLE"
}
