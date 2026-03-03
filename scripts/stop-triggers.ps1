# Stop ADF Triggers Before Deployment

param (
    [string]$FactoryName,
    [string]$ResourceGroupName
)

Write-Host "Stopping triggers in ADF..."

$triggers = az datafactory trigger list `
  --factory-name $FactoryName `
  --resource-group $ResourceGroupName `
  --query "[].name" -o tsv

foreach ($trigger in $triggers) {
    az datafactory trigger stop `
      --factory-name $FactoryName `
      --resource-group $ResourceGroupName `
      --name $trigger
}

Write-Host "All triggers stopped."
