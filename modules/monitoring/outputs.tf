output "grafana_service_dns" {
  description = "In-cluster DNS name for Grafana, for a Traefik IngressRoute or port-forward"
  value       = "kube-prometheus-stack-grafana.${var.monitoring_namespace}.svc.cluster.local"
}

output "prometheus_service_dns" {
  description = "In-cluster DNS name for Prometheus"
  value       = "kube-prometheus-stack-prometheus.${var.monitoring_namespace}.svc.cluster.local:9090"
}
