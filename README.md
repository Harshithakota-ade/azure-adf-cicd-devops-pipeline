# Azure ADF CI/CD DevOps Pipeline (GitHub Actions + ARM Templates)

This project demonstrates an end-to-end CI/CD approach for Azure Data Factory (ADF) using:
- Git integration (collaboration + version control)
- ARM template-based deployments
- Environment parameterization (Dev → Test → Prod)
- GitHub Actions workflows for automated deployments

> Goal: Show a production-ready, repeatable release process for ADF pipelines.

---

## Architecture

**Repo (Git)** → **ADF collaboration branch** → **Publish** → **ARM Templates (adf_publish)**  
GitHub Actions deploys templates to target Azure subscription/resource group:
- DEV (auto)
- PROD (manual approval / protected environment)

---

## What’s included

- `adf_publish/`  
  Sample ARM template + parameters representing ADF publish output.

- `.github/workflows/`  
  GitHub Actions pipelines:
  - `deploy-dev.yml` (auto deploy on push)
  - `deploy-prod.yml` (manual trigger)

- `parameterization/`  
  Environment-specific parameter files:
  - `dev.parameters.json`
  - `prod.parameters.json`

- `scripts/`  
  Helper scripts to validate templates and explain deployment steps.

- `docs/`  
  CI/CD design, branching strategy, and release checklist.

---

## CI/CD Flow (High Level)

1. Developer commits ADF changes to collaboration branch (e.g., `main`).
2. In ADF UI, developer clicks **Publish**.
3. ADF generates ARM templates into **adf_publish** (simulated here).
4. GitHub Actions deploys templates:
   - Dev: automatically on push to `main`
   - Prod: manually triggered workflow, uses prod parameters

---

## Interview Talking Points

- Why ARM templates are used for ADF deployments.
- How environment parameterization prevents hardcoding linked service endpoints.
- Secure authentication using GitHub Secrets + Azure Service Principal.
- Safe deployments with separate workflows and manual approvals for Prod.
- Branching strategy and release checklist.

---

## Required GitHub Secrets

Configure in GitHub Repo → Settings → Secrets and variables → Actions:

- `AZURE_CLIENT_ID`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_CLIENT_SECRET`

---

## Notes

This repo includes **sample ARM templates** (representative). In a real project:
- ARM templates are produced by ADF Publish
- Parameters are overwritten per environment
- Key Vault is used for secrets
