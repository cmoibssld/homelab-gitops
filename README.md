# HomeLab

On a debian VM self-host. 
Deploying Kubernetes, using Terraform and setting up a clean Gitops operation. 
Enhancing my skills in IaC

### First step: raw Kubernetes   
Deploying Focalboard, a Trello like application, with a persistant PostgreSQL. Using k3s command line and yaml file to configure the cluster. 

### Secound step: Helm charts
Adding monitoring of the cluster with Grafana and Prometheus but this time using Helm, crate manager for Kubernetes. Two main goals here: 1. understand how to deploy an app (here two monitorings apps) with Helm ; 2. understand how to create a crate, here using my hand-written focalboard cluster

### Third step: Terraform (current work)
First of all, automatation of the Helm release and install with only terraform apply the whole app + monitoring. Then manages of secrets with Terraform along with storage and etc.

### To come next:
Gitops -> on CD for now 
CI -> pipeline with githubactions, set up test
