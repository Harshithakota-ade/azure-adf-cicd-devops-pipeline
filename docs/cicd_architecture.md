# ADF CI/CD Architecture

## Why CI/CD for ADF?
ADF pipelines and linked services are critical production assets.
Manual changes increase risk. CI/CD ensures:
- Version control
- Repeatable deployments
- Auditability
- Environment consistency

## Deployment Approach
We use ADF Publish output (ARM templates) and deploy using GitHub Actions.

### DEV
- Auto deploy on push to `main`
- Quick feedback loop

### PROD
- Manual trigger using workflow_dispatch
- Promotes controlled releases
