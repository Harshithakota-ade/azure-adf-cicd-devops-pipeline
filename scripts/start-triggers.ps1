# Start ADF Triggers After Deployment

param (
    [string]$FactoryName,
    [string]$ResourceGroupName
)

Write-Host "Starting triggers in ADF..."

$triggers = az datafactory trigger list `
  --factory-name $FactoryName `
  --resource-group $ResourceGroupName `
  --query "[].name" -o tsv

foreach ($trigger in $triggers) {
    az datafactory trigger start `
      --factory-name $FactoryName `
      --resource-group $ResourceGroupName `
      --name $trigger
}

Write-Host "All triggers started."
