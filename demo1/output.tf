output "lb_ip" {
  value = kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.hostname
}

resource "time_sleep" "wait_120_seconds" {
  create_duration = "120s"
}


resource "null_resource" "curl_hello_world" {

  # shows output of curl command for load balancer
 provisioner "local-exec" {

    command = "curl -L http://${kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.hostname}:12344"
  }
  depends_on = [time_sleep.wait_120_seconds]
}
