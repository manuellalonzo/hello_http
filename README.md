# hello_http with EKS cluster 
This repo will build & configure a cluster of HelloHttp instances with EKS. We will be using two directories demo0 and demo1. We will cd to demo0 and execute the terraform init and terraform apply in order to bring up the infrastructure for our EKS helloHttp application. We will also run the below command in order to use TF output to control kubectrl.

```aws eks --region $(terraform output -raw region) update-kubeconfig  --name $(terraform output -raw cluster_name)```

Then cd to dem01 and run terraform init and terraform apply. This will build an image based on the docker file and upload it to Your ECR repository and then it will download the image and run the container(s) in AWS EKS.


#USAGE:

From the demo0 directory run the commands:

```terraform init``` 

```terraform apply``` 

```aws eks --region $(terraform output -raw region) update-kubeconfig  --name $(terraform output -raw cluster_name)```

Then after commands above completed, cd to demo1 and run:

```terraform init``` 

```terraform apply``` 

Answer the two questions after starting terrafrom apply:

  ```Your AWS account ID```
  
  ```Enter a value:```


 ```name of ECR repository for uploading image to```
 
  ```Enter a value:```


after terrafrom apply finishes run the command below to get port and URL info or look at the ouput for the curl command and see if it 
returns "hello world" , if so then the EKS loadbalancer/container is working as expected. the default port is 12344. 

```kubectl get services```



     
