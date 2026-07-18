This part of the project is about deploying the previous kubernetes cluster but inside a Debian-13 VM hosted on Azure Cloud.

#### Prerequisites
Install Terraform and Ansible.

### Steps:
In order to understand and to be better with cloud ops I take 4 steps.    
1. Deploy location locally with Terraform
```bash
cd azure
terraform init
terraform plan --out plan.azure
terraform apply plan.azure
```

2. Create cloud infrastructure with Terraform
```bash
cd ansible
ansible-playbook -i k3s_install.ini k3s_install
```
3. Configure cloud with Ansible (current work)
4. Deploy application on cloud with Terraform (similar call to step 1, might change it when going Gitops)
