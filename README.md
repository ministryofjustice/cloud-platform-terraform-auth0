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

## Inputs

|         Name          |                     Description               | Type   | Default | Required |
|-----------------------|-----------------------------------------------|:------:|:-------:|:--------:|
| cluster_name          | The VPC where bastion is going to be deployed | string |         | yes      |
| services_base_domain  | The DNS hostzone used within the auth0's Applications for the callbacks URLs| string | | yes |
| services_eks_domain   | The DNS hostzone used within the auth0's Applications for EKS callbacks URLs| string | | yes |

## Outputs

|           Name                |          Description          |
|-------------------------------|-------------------------------|
| oidc_kubernetes_client_id     | Kubernetes OIDC Client ID     |
| oidc_kubernetes_client_secret | Kubernetes OIDC Client Secret |
| oidc_components_client_id     | Components OIDC Client ID     |
| oidc_components_client_secret | Components OIDC Client Secret |
