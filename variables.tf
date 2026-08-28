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

