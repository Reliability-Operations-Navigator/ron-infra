variable "arc_version" { default = "0.9.3" }
variable "runner_name" { default = "k3s-runner" }
variable "github_config_url" { type = string }
variable "github_pat" { 
  type      = string
  sensitive = true 
}
