variable "cloudflare_tunnel_token" {
  type      = string
  sensitive = true
}
variable "namespace" {
  type    = string
  default = "kube-system"
}
