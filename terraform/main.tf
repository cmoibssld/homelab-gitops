provider "kubernetes" {
  config_path = "/etc/rancher/k3s/k3s.yaml"
}

provider "helm" {
  kubernetes = {
    config_path = "/etc/rancher/k3s/k3s.yaml"
  }
}

resource "helm_release" "focalboard" {
  name = "focalboard"
  namespace = "focalboard"
  create_namespace = true

  chart = "../kubernetes/helm/charts/focalboard"

  values = [
    file("../kubernetes/helm/charts/focalboard/values.yaml"),
    file("../kubernetes/helm/charts/focalboard/values.local.yaml")
  ]
  # no need to tell Terraform about the dependency
}

resource "helm_release" "grafana" {
  name = "grafana"
  namespace = "monitoring" 
  create_namespace = true

  repository = "https://grafana.github.io/helm-charts"
  chart = "grafana"

  values = [
    file("../kubernetes/helm/monitoring/grafana-values.yaml")
  ]
}

resource "helm_release" "prometheus" {
  name = "prometheus"
  namespace = "monitoring" # super important, because grafana will be expecting to look for prometheus in the monitoring namespace as the grafana-values.yaml file suggest it
  create_namespace = true

  repository = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus"

  timeout = 600 # 10 minutes more than the 5min default, VM can be ... slow

  values = [
    file("../kubernetes/helm/monitoring/prometheus-values.yaml")
  ]
}
