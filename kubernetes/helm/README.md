## Install monitoring (Grafana and Prometheus)

First, create a namespace called monitoring
```bash
kubectl create namespace monitoring
```


Secoundly, tell helm to fetch the grafana and prometheus charts and make sure they are up-to-date.

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

Lastly, install both utilities from the files inside the monitoring folder 

```bash
helm install monitoring prometheus-community/kube-prometheus-stack \
  -f monitoring/prometheus-values.yaml \
  --namespace monitoring

helm install grafana grafana/grafana \
  -f monitoring/grafana-values.yaml \
  --namespace monitoring
```

If changes have been made to the values.yaml file, update of the charts can be done with this:
```bash
helm upgrade grafana grafana/grafana -f monitoring/grafana-values.yaml -n monitoring
```
