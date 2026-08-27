resource "helm_release" "arc_controller" {
  name             = "arc"
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set-controller"
  namespace        = "arc-systems"
  create_namespace = true
  version          = var.arc_version
}

resource "helm_release" "arc_runner_scale_set" {
  name             = var.runner_name
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set"
  namespace        = "arc-runners"
  create_namespace = true
  version          = var.arc_version

  depends_on = [helm_release.arc_controller]

  set {
    name  = "githubConfigUrl"
    value = var.github_config_url
  }

  set {
    name  = "githubConfigSecret.github_token"
    value = var.github_pat
  }
}
