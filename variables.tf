variable "k8s_host" { type = string }
variable "traefik_version" { type = string }
variable "platform_namespace" {
  type    = string
  default = "platform"
}
variable "github_config_url" { type = string }
variable "github_pat" {
  type      = string
  sensitive = true
}
variable "monitoring_namespace" {
  type    = string
  default = "monitoring"
}
variable "grafana_admin_password" {
  type      = string
  sensitive = true
}
variable "argocd_values_path" {
  type = string
  validation {
    condition     = fileexists(var.argocd_values_path)
    error_message = "argocd_values_path does not point to a real file: ${var.argocd_values_path}"
  }

}
variable "traefik_values_path" {
  type = string
  validation {
    condition     = fileexists(var.traefik_values_path)
    error_message = "traefik_values_path does not point to a real file: ${var.traefik_values_path}"
  }
}
variable "cloudflare_tunnel_token" {
  type      = string
  sensitive = true
}

