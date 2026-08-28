variable "monitoring_namespace" {
  type    = string
  default = "monitoring"
}

variable "chart_version" {
  type    = string
  default = "62.3.0"
}

variable "prometheus_retention" {
  type    = string
  default = "10d"
}

variable "prometheus_storage_size" {
  type    = string
  default = "10Gi"
}

variable "grafana_storage_size" {
  type    = string
  default = "2Gi"
}

variable "grafana_admin_password" {
  type      = string
  sensitive = true
}

variable "enable_alertmanager" {
  type    = bool
  default = false   
}
