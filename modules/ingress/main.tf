resource "helm_release" "traefik" {
  name       = "traefik"
  repository = "https://traefik.github.io/charts"
  chart      = "traefik"
  namespace  = "kube-system"
  version    = var.traefik_version
  values     = [file(var.traefik_values_path)]
}
