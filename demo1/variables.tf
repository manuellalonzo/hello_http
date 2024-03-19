
variable "AWS_DEFAULT_REGION" {
  type        = string
  description = "AWS default region"
  default     = "us-east-2"
}

variable "IMAGE_REPO_NAME" {
  type = string
  description = "name of ECR repository for uploading image to"

}

variable "AWS_ACCOUNT_ID" {
  type        = string
  description = "Your AWS account ID"
}

variable "IMAGE_TAG" {
  type        = string
  description = "This is the tag for your created image"
  default     = "latest"
}
