module "namespaces" {
  source     = "./modules/namespaces"
}

module "networking" {
  source     = "./modules/networking"
  k8s_host   = "192.168.1.150"
  depends_on = [module.namespaces]
}

module "gitops" {
  source     = "./modules/gitops"
  namespace  = "platform"
  depends_on = [module.networking, module.namespaces]
}

module "ingress" {
  source          = "./modules/ingress"
  traefik_version = "41.3.0"
  depends_on      = [module.networking]
}
