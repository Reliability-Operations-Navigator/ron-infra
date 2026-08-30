module "namespaces" {
  source = "./modules/namespaces"
}

module "networking" {
  source     = "./modules/networking"
  k8s_host   = var.k8s_host
  depends_on = [module.namespaces]
}

module "gitops" {
  source     = "./modules/gitops"
  namespace  = var.platform_namespace
  depends_on = [module.networking, module.namespaces]
  argocd_values_path  = var.argocd_values_path
}

module "ingress" {
  source          = "./modules/ingress"
  traefik_version = var.traefik_version
  depends_on      = [module.networking]
  traefik_values_path  = var.traefik_values_path
}

module "arc" {
  source            = "./modules/arc"
  github_config_url = var.github_config_url
  github_pat        = var.github_pat
  depends_on        = [module.networking]
}
module "monitoring" {
  source                 = "./modules/monitoring"
  monitoring_namespace   = var.monitoring_namespace
  grafana_admin_password = var.grafana_admin_password
}
module "cloudflared" {
  source                  = "./modules/cloudflared"
  cloudflare_tunnel_token = var.cloudflare_tunnel_token
  depends_on              = [module.networking]
}
