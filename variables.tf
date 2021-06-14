variable "cluster_name" {
  description = "Kubernetes cluster name - used to name (id) the auth0 resources"
}

variable "services_base_domain" {
  description = "Base domain to be used for the callbacks URLs"
}

variable "extra_callbacks" {
  description = "Extra callbacks URLs that can be added to the auth0 application - e.g: concourse, sonarqube, etc"
  default     = [""]
  type        = list(any)
}
