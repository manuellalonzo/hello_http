resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    labels = {
      App = "ScalableNginxExample"
    }
  }

  spec {
    replicas = 1 
    selector {
      match_labels = {
        App = "ScalableNginxExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableNginxExample"
        }
      }
      spec {
        container {
          #image = "debian"
          #image = "855629250984.dkr.ecr.us-east-2.amazonaws.com/test6"
	  image = "${var.AWS_ACCOUNT_ID}.dkr.ecr.${var.AWS_DEFAULT_REGION}.amazonaws.com/${var.IMAGE_REPO_NAME}"	
          #image = "nginx"
          name  = "example"

          port {
            container_port = 12344 
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi" 

    #depends_on = [null_resource.ecr_image_upload]       
            }
          }
        }
      }
    }
  }
depends_on = [null_resource.ecr_image_upload]
}
