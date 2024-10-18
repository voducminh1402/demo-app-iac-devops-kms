variable "repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "The image tag mutability setting for the repository"
  type        = string
  default     = "IMMUTABLE"
}
