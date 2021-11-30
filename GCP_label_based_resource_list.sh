#!/bin/bash
echo -e '
This script will get project name and show following results
1. Resources which DO NOT have a "costcenter" label or any label related to "costcenter"
2. Resources which have label: "costcenter"
3. Resources which have label: "costcenter2"
4. Resources which have label: "coscenter"
5. Resources which have label: "cost-center"
6. Resources which have label: "cost-centre"

NOTE: there are multiple different variations of label "costcenter" available. This script will list all possibilities of label "costcenter" and will store them in .csv file each
\n'

echo -e "Select a project \n"

gcloud projects list --sort-by=projectId --format="value(projectId)"
echo -e "\n"
echo -e "Enter Project Name \n"
read project_name
echo -e "\n"

rm $PWD/$project_name-all-unlabelled-resources.csv >/dev/null 2>/dev/null
rm $PWD/$project_name-label-costcenter.csv >/dev/null 2>/dev/null
rm $PWD/$project_name-label-costcenter2.csv >/dev/null 2>/dev/null
rm $PWD/$project_name-label-coscenter.csv >/dev/null 2>/dev/null
rm $PWD/$project_name-label-cost-center.csv >/dev/null 2>/dev/null
rm $PWD/$project_name-label-cost-centre.csv >/dev/null 2>/dev/null

sleep 3

echo -e "1. Resources which dont have a 'costcenter' label"
echo -e "\n"
gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* NOT parentAssetType:bigquery.googleapis.com/Dataset* NOT labels:cos*"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-all-unlabelled-resources.csv
echo -e "result is stored in $PWD/$project_name-all-unlabelled-resources.csv \n"

echo -e "2. Resources which have label: costcenter \n"

gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* NOT parentAssetType:bigquery.googleapis.com/Dataset* labels:costcenter"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-label-costcenter.csv
echo -e "result is stored in $PWD/$project_name-label-costcenter.csv \n"

echo -e "3. Resources which have label: costcenter2 \n"

gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* NOT parentAssetType:bigquery.googleapis.com/Dataset* labels:costcenter2"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-label-costcenter2.csv
echo -e "result is stored in $PWD/$project_name-label-costcenter2.csv \n"

echo -e "4. Resources which have label: coscenter \n"

gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* NOT parentAssetType:bigquery.googleapis.com/Dataset* labels:coscenter"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-label-coscenter.csv
echo -e "result is stored in $PWD/$project_name-label-coscenter.csv \n"

echo -e "5. Resources which have label: cost-center \n"

gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* lNOT parentAssetType:bigquery.googleapis.com/Dataset* labels:cost-center"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-label-cost-center.csv
echo -e "result is stored in $PWD/$project_name-label-cost-center.csv \n"

echo -e "6. Resources which have label: cost-centre \n"

gcloud asset search-all-resources --scope=projects/$project_name --query="NOT parentAssetType:k8s.io* NOT parentAssetType:container.googleapis.com* NOT parentAssetType:bigquery.googleapis.com/Dataset* labels:cost-centre"  --order-by=createTime --format="csv(parentAssetType,assetType,displayName,folders,labels,createTime,location,state)" > $project_name-label-cost-centre.csv
echo -e "result is stored in $PWD/$project_name-label-cost-centre.csv \n"

echo "END"
