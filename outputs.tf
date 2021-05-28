output "oidc_components_client_id" {
  value       = auth0_client.components.client_id
  description = "Components OIDC Client ID"
}

output "oidc_components_client_secret" {
  value       = auth0_client.components.client_secret
  description = "Components OIDC Client Secret"
}

output "oidc_kubernetes_client_id" {
  value       = auth0_client.kubernetes.client_id
  description = "Kubernetes OIDC Client ID"
}

output "oidc_kubernetes_client_secret" {
  value       = auth0_client.kubernetes.client_secret
  description = "Kubernetes OIDC Client Secret"
}
