#!/usr/bin/env bash

outputs=$(terraform output)
function terraform_output {
  echo "${outputs}" | awk -F " = " "\$1 == \"$1\" { print \$2 }"
}

export STACK_NAME=$(terraform_output stack_name)
export K8S_BUCKET=$(terraform_output k8s_bucket)
export CLUSTER_NAME=$(terraform_output stack_dns)
export VPC_ID=$(terraform_output vpc_id)
export VPC_CIDR=$(terraform_output vpc_cidr)
export REGION=$(terraform_output stack_region)
export AWS_ACCOUNT_ID=$(terraform_output account_id)
export K8S_NETWORK="weave"
export K8S_MASTER_INSTANCE_SIZE=$(terraform_output k8s_master_instance_size)
export K8S_MASTER_COUNT=$(terraform_output k8s_master_count)
export K8S_NODE_INSTANCE_SIZE=$(terraform_output k8s_node_instance_size)
export K8S_NODE_COUNT=$(terraform_output k8s_node_count)
export PUBLIC_DOMAIN_ZONE_ID=$(terraform_output public_domain_zone_id)
export PUBLIC_ACM_CERT_ARN=$(terraform_output public_domain_certificate_arn)
export K8S_PUBLIC_ACM_CERT_ARN=$(terraform_output k8s_public_domain_certificate_arn)
export K8S_PUBLIC_FULLCHAIN_ACM_CERT_ARN=$(terraform_output k8s_public_fullchain_domain_certificate_arn)
export K8S_PRIVATE_ACM_CERT_ARN=$(terraform_output k8s_private_domain_certificate_arn)

# Set the AWS profile
export AWS_SDK_LOAD_CONFIG=1
export AWS_PROFILE=$(terraform_output aws_account_profile)
export AWS_DEFAULT_PROFILE=$AWS_PROFILE
