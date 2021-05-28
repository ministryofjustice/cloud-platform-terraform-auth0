# cloud-platform-terraform-auth0

Terraform module that creates the auth0 clients for the Kubernetes server and its components

## Usage

```hcl
module "auth0" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-auth0?ref=0.0.1"

  cluster_name         = local.cluster_name
  services_base_domain = local.services_base_domain
  services_eks_domain  = local.services_eks_domain
}
```

<!--- BEGIN_TF_DOCS --->

<!--- END_TF_DOCS --->

