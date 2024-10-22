# lineten-sre-assessment
Solution for the SRE assessment for LineTen. This repository contains the code, infrastructure as code (IaC), and documentation required to deploy a containerized application on Azure using Kubernetes, managed through Terraform, and integrated with CI/CD for automated deployment.



# LineTen SRE Assessment

## Overview
This repository contains the implementation for the SRE assessment task provided by LineTen. The objective is to containerize an application, deploy it to Azure Kubernetes Service (AKS), and manage the infrastructure using Terraform. A CI/CD pipeline is configured to automate deployments upon every commit.

## Application Details
- The application is a simple "Hello World" service that exposes an endpoint (`/`) to verify successful deployment.
- The code is written in [Language of your choice].

## Deployment and Infrastructure
- **Cloud Provider**: Azure
- **Container Orchestration**: Kubernetes (AKS)
- **Infrastructure as Code**: Terraform
- **CI/CD**: GitHub Actions (configured to deploy on every commit)

## How to Run Locally
For local development and testing, Docker Compose can be used:
```bash
cd docker-compose
docker-compose up
```
![image](https://github.com/user-attachments/assets/5911abcd-4310-4ee4-a889-1ee86c708534)


## Setting up everything to apply terraform config
1. Install `azure cli` using the instructions from Microsoft website
2. Check if `azure cli` is installed correctly by running:
```bash
az version
```
You'll see output similar to the following:
```json
{
  "azure-cli": "2.65.0",
  "azure-cli-core": "2.65.0",
  "azure-cli-telemetry": "1.1.0",
  "extensions": {}
}
```
3. Login into your account using `az cli`, select appropriate subscription id when prompted.
```bash
az login
```
If successful, there will no be any error messages in console output, and output will contain lines similar to following:

```
Tenant: Your Directory
Subscription: Your Azure Subscription (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx)
```
## Adjust terraform .tfvars file and apply the configuration

1. Open the existing `tfvars/changeme.tfvars`.
2. Fill in your Azure Subscription ID (which has the `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx` format) into the `azure_subscription_id` field.2
3. Adjust other properties as needed.
4. Navigate to the `terraform` directory of the project.
```bash
cd terraform
```
5. Apply the configuration, when prompted - verify configuration which will be applied and approve this action.

```bash
terraform apply --var-file=tfvars/changeme.tfvars
```

Other way, with autoapproval enabled:

```bash
terraform apply --var-file=tfvars/changeme.tfvars --auto-approve
```

6. When this setup needs to be destroyed, execute the following:
```bash
terraform destroy --var-file=tfvars/changeme.tfvars
```
Other way, with autoapproval enabled:

```bash
terraform apply --var-file=tfvars/changeme.tfvars --auto-approve
```

## Get kubeconfig data from created cluster

1. Install `kubectl`
2. To get the kubeconfig data execute:
```bash
terraform output -raw kube_config
```

3. Save the output to the file, say `/tmp/kubeconfig`
4. Save the output to the `KUBECONFIG_DATA` repository secret in github.
5. Set location of kubeconfig by executing
```bash
export KUBECONFIG=/tmp/kubeconfig
```
6. Verify the app is running
```bash
kubectl get pods -n lineten
```

## Verify the service is running:

1. Find the service IP:
```bash
kubectl get service lineten-service -n lineten
```

The output will be similar to the following:
```
$ kubectl get service lineten-service -n lineten
NAME              TYPE           CLUSTER-IP    EXTERNAL-IP      PORT(S)          AGE
lineten-service   LoadBalancer   10.0.181.78   72.144.131.215   8080:30464/TCP   14s
```

Where 72.144.131.215 is the external IP on which our service is available

2. Navigate to the 72.144.131.215:8080 in browser. There you'll see a page showing your IP address.
