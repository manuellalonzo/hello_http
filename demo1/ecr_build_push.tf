resource "null_resource" "ecr_image_upload" {

  # Runs the build.sh script which builds the dockerfile and pushes to ecr
 provisioner "local-exec" {

    command = "aws ecr get-login-password --region ${var.AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${var.AWS_ACCOUNT_ID}.dkr.ecr.${var.AWS_DEFAULT_REGION}.amazonaws.com"
  }
 provisioner "local-exec" {

    command = "./build_img.sh ${var.AWS_DEFAULT_REGION} ${var.IMAGE_REPO_NAME} ${var.AWS_ACCOUNT_ID} ${var.IMAGE_TAG}"
  }
}
