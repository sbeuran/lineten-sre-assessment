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
docker-compose up

