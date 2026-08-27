terraform {
  backend "kubernetes" {
    secret_suffix = "ron-infra-state"
    config_path   = "~/.kube/config"
    namespace     = "kube-system"
  }
}
