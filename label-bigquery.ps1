# apply labels to all datasets in a bigquery project using the bq command line tool
$PROJECT_ID = "your-project-id"
$datasetsJson = bq ls --project_id=$PROJECT_ID --format=json
$datasets = $datasetsJson | ConvertFrom-Json | ForEach-Object { $_.datasetReference.datasetId }
foreach ($dataset in $datasets) {
    Write-Host "Applying labels to dataset $dataset"
    bq update --set_label label:key "${PROJECT_ID}:${dataset}"
    #bq update --set_label label:key "${PROJECT_ID}:${dataset}"... add more labels here
}
Write-Host "Done"