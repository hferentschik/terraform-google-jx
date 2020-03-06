#!/bin/bash

set -e
set -u

echo $GOOGLE_APPLICATION_CREDENTIALS
cat $GOOGLE_APPLICATION_CREDENTIALS

PROJECT=terraform-test-261120
#PROJECT=terraform-test
CLUSTER_NAME=tf-${BRANCH_NAME}-${BUILD_NUMBER}
CLUSTER_NAME=$( echo ${CLUSTER_NAME} | tr  '[:upper:]' '[:lower:]')
PARENT_DOMAIN="${CLUSTER_NAME}.jenkins-x-test.test"
VARS="-var gcp_project=${PROJECT} -var region=europe-west1 -var zone=europe-west1-b -var cluster_name=${CLUSTER_NAME} -var parent_domain=${PARENT_DOMAIN}"

function cleanup()
{
	echo "Cleanup..."
	terraform destroy $VARS -auto-approve
}

trap cleanup EXIT

echo "Generating Plan..."
PLAN=$(terraform plan $VARS -no-color)

echo "Logging Plan..."
jx step pr comment --code --comment="${PLAN}"

echo "Creating cluster ${CLUSTER_NAME} in project ${PROJECT}..."

echo "Applying Terraform..."
terraform apply $VARS -auto-approve

JX_REQUIREMENTS=$(cat jx-requirements.yaml)
jx step pr comment --code --comment="${JX_REQUIREMENTS}"
