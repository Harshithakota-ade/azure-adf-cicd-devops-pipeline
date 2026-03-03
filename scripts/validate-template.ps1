# Validate ARM Template Before Deployment

param (
    [string]$ResourceGroupName,
    [string]$TemplateFile,
    [string]$ParameterFile
)

Write-Host "Validating ARM Template..."

az deployment group validate `
  --resource-group $ResourceGroupName `
  --template-file $TemplateFile `
  --parameters @$ParameterFile

Write-Host "Validation completed."
