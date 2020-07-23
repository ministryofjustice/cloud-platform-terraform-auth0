variable "cluster_name" {
  description = "Kubernetes cluster name"
}

variable "services_base_domain" {
  description = "Base domain to be used"
}

variable "services_eks_domain" {
  description = "Base domain to be used for EKS cluster"
}

variable "eks" {
  description = "kops cluster or EKS"
  type        = bool
  default     = false
}