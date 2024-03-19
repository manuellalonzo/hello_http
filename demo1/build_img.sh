#!/bin/bash

set -e
AWS_DEFAULT_REGION=$1
IMAGE_REPO_NAME=$2
AWS_ACCOUNT_ID=$3
IMAGE_TAG=$4

# Check aws      
which aws > /dev/null || { echo 'ERROR: aws-cli is not installed' ; exit 1; }

# Check docker 
which docker > /dev/null && docker ps > /dev/null || { echo 'ERROR: docker is not running' ; exit 1; }

echo "echo Logging in to Amazon ECR..."

REPOSITORY_URI=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$IMAGE_REPO_NAME
echo "aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com"
echo "$REPOSITORY_URI"

echo "Build started on `date`"
echo "Building the Docker image..."  
docker build -t $REPOSITORY_URI:$IMAGE_TAG .
docker tag $REPOSITORY_URI:$IMAGE_TAG $REPOSITORY_URI:$IMAGE_TAG


echo "Build completed on `date`"
echo "Pushing the Docker image to ECR"
docker push $REPOSITORY_URI:$IMAGE_TAG
echo "docker push $REPOSITORY_URI:$IMAGE_TAG"  
