resource "helm_release" "cilium" {
  name       = "cilium"
  repository = "https://helm.cilium.io/"
  chart      = "cilium"
  namespace  = "kube-system"
  version    = var.cilium_version

  set { 
    name = "kubeProxyReplacement" 
    value = "true" 
  }
  set {
    name = "k8sServiceHost" 
    value = var.k8s_host
  }
  set {
    name = "k8sServicePort"
    value = "6443"
  
  }
  set {
    name = "operator.replicas"
    value = "1"
  }
}
