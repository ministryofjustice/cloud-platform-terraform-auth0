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
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| auth0 | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [auth0_client](https://registry.terraform.io/providers/alexkappa/auth0/latest/docs/resources/client) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Kubernetes cluster name - used to name (id) the auth0 resources | `any` | n/a | yes |
| extra\_callbacks | Extra callbacks URLs that can be added to the auth0 application - e.g: concourse, sonarqube, etc | `list(any)` | `null` | no |
| services\_base\_domain | Base domain to be used for the callbacks URLs | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| oidc\_components\_client\_id | Components OIDC Client ID |
| oidc\_components\_client\_secret | Components OIDC Client Secret |
| oidc\_kubernetes\_client\_id | Kubernetes OIDC Client ID |
| oidc\_kubernetes\_client\_secret | Kubernetes OIDC Client Secret |

<!--- END_TF_DOCS --->

