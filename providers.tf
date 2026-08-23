terraform {
  required_providers {
    helm       = { source = "hashicorp/helm", version = "~> 2.13" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.31" }
  }
}

provider "kubernetes" {
  config_path = "/home/devops/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "/home/devops/.kube/config"
  }
}
