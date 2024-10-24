# cicdproject
This repo is for inlogik CICD demo project

Resources are created with Terraform
CI Process : Azure pipeline will look for changes in appcode repo in Azure Repos and start the build stages
Build : Build the Image
Push : Push the Image to ACR
Update : Update the latest image tag in deployment.yaml file

CD Process : Gitops using ArgoCD.
Argocd will look for changes in the Azure Repo and start the deployment process to K8's cluster.
Argocd is deployed in K8's cluster with namespace Argocd

CI-CD Process Flow:

![inlogik cicd automation (2)](https://github.com/user-attachments/assets/9718a046-7f26-47ec-a273-a3579fc0e7e1)

