# cicdproject
This repo is for inlogik CICD demo project

Resources are created with Terraform.
CI Process : Azure pipeline will look for changes in appcode repo from Azure Repos and start the below stages
Build : Build the Image
Push : Push the Image to ACR
Update : Update the latest image tag in deployment.yaml file

CD Process : Gitops using ArgoCD.
Argocd will look for changes in the Azure Repo and start the deployment process to K8's cluster.
Argocd is deployed in K8's cluster with namespace Argocd

CI-CD Process Flow:

![inlogik cicd automation (3)](https://github.com/user-attachments/assets/7d17cfca-0e1a-476b-94b1-1777de088731)

As I have done my code chages in Azure Repo, i have replicated the code base in Github. Please find the screenshot of Azure Devops and ArgoCD.

ACR with images pushed as part of CI automation,

![Screen Shot 2024-10-24 at 4 06 35 PM](https://github.com/user-attachments/assets/8f13a5e4-f3db-4093-a988-0f06bf9a90b2)

Azure Repo screenshot,
![Screen Shot 2024-10-24 at 4 28 20 PM](https://github.com/user-attachments/assets/b74c329f-9ab2-4942-bb50-c115cef8d28d)

Azurepipeline screenshot,
![Screen Shot 2024-10-24 at 4 11 52 PM](https://github.com/user-attachments/assets/a5dbe053-21a3-425d-baad-462523645f1c)

ArgoCD screenshot,
![Screen Shot 2024-10-24 at 4 13 33 PM](https://github.com/user-attachments/assets/a6943b15-5174-4b9e-85d1-05040df78285)

