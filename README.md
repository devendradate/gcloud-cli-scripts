File: GCP_label_based_resource_list.sh

This script will get project name and show following results
1. Resources which DO NOT have a "costcenter" label or any label related to "costcenter"
2. Resources which have label: "costcenter"
3. Resources which have label: "costcenter2"
4. Resources which have label: "coscenter"
5. Resources which have label: "cost-center"
6. Resources which have label: "cost-centre"
NOTE: there are multiple different variations of label "costcenter" available. This script will list all possibilities of label "costcenter" and will store them in .csv file each


File: GCP_last_24_hours_unlabelled_resources.sh

This script will show resources created in last 24 hours without labels in gcp env
