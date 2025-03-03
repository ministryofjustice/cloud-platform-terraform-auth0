#
# See instructions here: https://github.com/ministryofjustice/kubernetes-investigations/tree/master/auth0
#              and here: https://github.com/yieldr/terraform-provider-auth0
#
# The empty configuration assumes that you have the appropriate environment
# variables exported as explained in the upstream repo and is similar to the way
# the AWS providr credentials are handled.
#

resource "auth0_client" "kubernetes" {
  name              = "${var.cluster_name}:kubernetes"
  description       = "Cloud Platform kubernetes"
  app_type          = "regular_web"
  cross_origin_auth = true

  callbacks = [
    format(
      "https://login.%s/ui",
    var.services_base_domain)
  ]

  custom_login_page_on = true
  is_first_party       = true
  oidc_conformant      = true
  sso                  = true

  jwt_configuration {
    alg                 = "RS256"
    lifetime_in_seconds = "36000"
  }
}

# Get client secret for kubernetes
data "auth0_client" "kubernetes" {
  client_id = auth0_client.kubernetes.client_id
}

resource "auth0_client" "components" {
  name              = "${var.cluster_name}:components"
  description       = "Cloud Platform components"
  app_type          = "regular_web"
  cross_origin_auth = true

  callbacks = compact(concat([
    format(
      "https://prometheus.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://alertmanager.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://thanos.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://grafana.%s/login/generic_oauth",
      var.services_base_domain,
    ),
  ], var.extra_callbacks))

  custom_login_page_on = true
  is_first_party       = true
  oidc_conformant      = true
  sso                  = true

  jwt_configuration {
    alg                 = "RS256"
    lifetime_in_seconds = "36000"
  }
}

# Get client secret for components
data "auth0_client" "components" {
  client_id = auth0_client.components.client_id
}
