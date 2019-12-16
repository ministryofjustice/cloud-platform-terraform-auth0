output "oidc_kubernetes_client_id" {
  value = auth0_client.kubernetes.client_id
}

output "oidc_kubernetes_client_secret" {
  value = auth0_client.kubernetes.client_secret
}

output "oidc_components_client_id" {
  value = auth0_client.components.client_id
}

output "oidc_components_client_secret" {
  value = auth0_client.components.client_secret
}
