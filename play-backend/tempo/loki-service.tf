resource "kubernetes_manifest" "service_loki" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert"
        "kompose.version" = "1.28.0 (HEAD)"
        "namespace" = "monitoring"
      }
      "labels" = {
        "io.kompose.service" = "loki"
      }
      "name" = "loki"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "3100"
          "port" = 3100
          "targetPort" = 3100
        },
      ]
      "selector" = {
        "io.kompose.service" = "loki"
      }
    }
  }
}
