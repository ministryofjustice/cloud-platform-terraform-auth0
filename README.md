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
| extra\_callbacks | Extra callbacks URLs that can be added to the auth0 application - e.g: concourse, sonarqube, etc | `list(any)` | <pre>[<br>  ""<br>]</pre> | no |
| services\_base\_domain | Base domain to be used for the callbacks URLs | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| oidc\_components\_client\_id | Components OIDC Client ID |
| oidc\_components\_client\_secret | Components OIDC Client Secret |
| oidc\_kubernetes\_client\_id | Kubernetes OIDC Client ID |
| oidc\_kubernetes\_client\_secret | Kubernetes OIDC Client Secret |

<!--- END_TF_DOCS --->


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | >=0.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | >=0.27.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [auth0_client.components](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/client) | resource |
| [auth0_client.kubernetes](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/client) | resource |
| [auth0_client.components](https://registry.terraform.io/providers/auth0/auth0/latest/docs/data-sources/client) | data source |
| [auth0_client.kubernetes](https://registry.terraform.io/providers/auth0/auth0/latest/docs/data-sources/client) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes cluster name - used to name (id) the auth0 resources | `any` | n/a | yes |
| <a name="input_extra_callbacks"></a> [extra\_callbacks](#input\_extra\_callbacks) | Extra callbacks URLs that can be added to the auth0 application - e.g: concourse, sonarqube, etc | `list(any)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_services_base_domain"></a> [services\_base\_domain](#input\_services\_base\_domain) | Base domain to be used for the callbacks URLs | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_components_client_id"></a> [oidc\_components\_client\_id](#output\_oidc\_components\_client\_id) | Components OIDC Client ID |
| <a name="output_oidc_components_client_secret"></a> [oidc\_components\_client\_secret](#output\_oidc\_components\_client\_secret) | Components OIDC Client Secret |
| <a name="output_oidc_kubernetes_client_id"></a> [oidc\_kubernetes\_client\_id](#output\_oidc\_kubernetes\_client\_id) | Kubernetes OIDC Client ID |
| <a name="output_oidc_kubernetes_client_secret"></a> [oidc\_kubernetes\_client\_secret](#output\_oidc\_kubernetes\_client\_secret) | Kubernetes OIDC Client Secret |
<!-- END_TF_DOCS -->