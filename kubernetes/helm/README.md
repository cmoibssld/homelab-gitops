## Install monitoring (Grafana and Prometheus)

First, create a namespace called monitoring
```bash
kubectl create namespace monitoring
```


Secondly, tell helm to fetch the grafana and prometheus charts and make sure they are up-to-date.

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

Lastly, install both utilities from the files inside the monitoring folder 

```bash
helm install prometheus prometheus-community/prometheus \
  --namespace monitoring

helm install grafana grafana/grafana \
  -f monitoring/grafana-values.yaml \
  --namespace monitoring
```

Now Grafana can start to display metric scrapped by Prometheus. 
Import dashboard number 1860 and 3662 to start visualizing some data. Right now it can monitor usage of the server and of kubernetes cluster. Later might introduce a monitoring of Focalboard through the /metrics. Both Grafana and Prometheus shoudl support pods deletion since persistent storage is activated (requires at least two times 2Gi for both)


If changes have been made to the values.yaml file, update of the charts can be done with this:
```bash
helm upgrade --install grafana grafana/grafana \
    -f monitoring/grafana-values.yaml \
    --namespace monitoring 
```
```bash
helm upgrade --install prometheus prometheus-community/prometheus \
    -f monitoring/prometheus-values.yaml \
    --namespace monitoring
```
