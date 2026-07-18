# HomeLab

On a debian VM self-host (first) and a cloud VM. 
Deploying Kubernetes, using Terraform and setting up a clean Gitops operation. 
Enhancing my skills in IaC

### First step: raw Kubernetes   
Deploying Focalboard, a Trello like application, with a persistant PostgreSQL. Using k3s command line and yaml file to configure the cluster. 

### Secound step: Helm charts
Adding monitoring of the cluster with Grafana and Prometheus but this time using Helm, crate manager for Kubernetes. Two main goals here: 1. understand how to deploy an app (here two monitorings apps) with Helm ; 2. understand how to create a crate, here using my hand-written focalboard cluster

### Third step: Terraform
First of all, automatation of the Helm release and install with only terraform apply the whole app + monitoring. Then manages of secrets with Terraform along with storage and etc.

### Fourth step: Cloud (current work)
1. Let Terraform install a cloud VM (with Azure) and let Ansible configure it so Terraform can then install the app.  
To enter VM with ssh:
    1. Save ssh_private_key into file:
    ```bash
    terraform output --raw private_ssh_key > key.ssh
    ```
    2. Enter VM by provisionning public IP and private key
    ```bash
    ssh -i key.ssh azureuser@(terraform output --raw public_ip)
    ```
2. Test on Azure kubernetes machines (AKS).

### To come next:
Gitops -> on CD for now 
CI -> pipeline with githubactions, set up test
