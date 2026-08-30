resource "kubernetes_secret" "cloudflared_token" {
  metadata {
    name      = "cloudflared-token"
    namespace = var.namespace
  }
  data = {
    token = var.cloudflare_tunnel_token
  }
}

resource "kubernetes_deployment" "cloudflared" {
  metadata {
    name      = "cloudflared"
    namespace = var.namespace
  }
  spec {
    replicas = 1
    selector { match_labels = { app = "cloudflared" } }
    template {
      metadata { labels = { app = "cloudflared" } }
      spec {
        container {
          name  = "cloudflared"
          image = "cloudflare/cloudflared:latest"
          args  = ["tunnel", "run"]
          env {
            name = "TUNNEL_TOKEN"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.cloudflared_token.metadata[0].name
                key  = "token"
              }
            }
          }
        }
      }
    }
  }
}
