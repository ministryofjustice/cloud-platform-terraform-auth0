#
# See instructions here: https://github.com/ministryofjustice/kubernetes-investigations/tree/master/auth0
#              and here: https://github.com/yieldr/terraform-provider-auth0
#
# The empty configuration assumes that you have the appropriate environment
# variables exported as explained in the upstream repo and is similar to the way
# the AWS providr credentials are handled.
#

resource "auth0_client" "kubernetes" {
  name        = "${var.cluster_name}:kubernetes"
  description = "Cloud Platform kubernetes"
  app_type    = "regular_web"

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
    lifetime_in_seconds = "2592000"
  }
}

resource "auth0_client" "components" {
  name        = "${var.cluster_name}:components"
  description = "Cloud Platform components"
  app_type    = "regular_web"

  callbacks =   var.eks == true ? concat(local.callbacks_default , local.callbacks_eks) : local.callbacks_default

  custom_login_page_on = true
  is_first_party       = true
  oidc_conformant      = true
  sso                  = true

  jwt_configuration {
    alg                 = "RS256"
    lifetime_in_seconds = "36000"
  }
}

locals {
  callbacks_default    = [
    format(
      "https://prometheus.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://prometheus-infra.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://alertmanager.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://grafana.%s/login/generic_oauth",
      var.services_base_domain,
    ),
    format(
      "https://kibana.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://kibana-audit.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://dsd-kibana.%s/oauth2/callback",
      var.services_base_domain,
    ),
    format(
      "https://kube-ops.%s/login/authorized",
      var.services_base_domain,
    ),
  ]
  callbacks_eks    = [
    format(
      "https://sonarqube.%s/oauth2/callback/oidc",
      var.services_eks_domain,
    ),
    format(
      "https://concourse.%s/sky/issuer/callback",
      var.services_base_domain,
    ),
  ]
}
