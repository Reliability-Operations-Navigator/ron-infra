resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = var.monitoring_namespace
  }
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = var.chart_version
  namespace  = kubernetes_namespace.monitoring.metadata[0].name

  values = [
    yamlencode({
      prometheus = {
        prometheusSpec = {
          retention = var.prometheus_retention
          # Bounds Prometheus's own resource usage — important on the Agni's
          # 16GB budget alongside everything else running.
          resources = {
            requests = { cpu = "100m", memory = "256Mi" }
            limits   = { cpu = "500m", memory = "768Mi" }
          }
          storageSpec = {
            volumeClaimTemplate = {
              spec = {
                # Repointed via scripts/configure-local-path-storage.sh —
                # lands under /home/devops/volumes/monitoring-<pvc-name>
                storageClassName = "local-path"
                accessModes      = ["ReadWriteOnce"]
                resources = {
                  requests = { storage = var.prometheus_storage_size }
                }
              }
            }
          }
        }
      }

      grafana = {
        adminPassword = var.grafana_admin_password
        resources = {
          requests = { cpu = "50m", memory = "128Mi" }
          limits   = { cpu = "200m", memory = "256Mi" }
        }
        persistence = {
          enabled          = true
          storageClassName = "local-path"
          size             = var.grafana_storage_size
        }
      }

      alertmanager = {
        enabled = var.enable_alertmanager
      }
    })
  ]
}
