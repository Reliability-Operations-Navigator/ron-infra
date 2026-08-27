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
}

module "ingress" {
  source          = "./modules/ingress"
  traefik_version = var.traefik_version
  depends_on      = [module.networking]
}

module "arc" {
  source            = "./modules/arc"
  github_config_url = var.github_config_url
  github_pat        = var.github_pat
  depends_on        = [module.networking]
}
