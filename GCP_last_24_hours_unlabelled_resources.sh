#!/bin/bash
previous_date=`date -d "yesterday" '+%Y-%m-%d'`
echo -e "previous date is $previous_date \n"

current_date=`date '+%Y-%m-%d'`
echo -e "current date is $current_date \n"

echo -e "Select Project to list resources which created in last 24 hours which dont have a 'costcenter' label: \n"

gcloud projects list --sort-by=projectId --format="value(projectId)"

echo -e "\n"

echo -e  "Type project name: \n"
read project_name
echo -e "\n"
echo -e "result will be stored in $project_name-last-24-hours-untagged-resources-$current_date.csv"
echo -e "\n"

#original

#gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* NOT labels:cost* AND createTime>$previous_date"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-last-24-hours-untagged-resources-$current_date.csv
gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* NOT parentAssetType:bigquery.googleapis.com/Dataset* NOT labels:cost* AND createTime>$previous_date"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-last-24-hours-untagged-resources-$current_date.csv

echo -e "\n"

echo -e "result is stored in $PWD/$project_name-last-24-hours-untagged-resources-$current_date.csv"
