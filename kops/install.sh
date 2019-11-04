#!/usr/bin/env bash

if ! [ -x "$(command -v jq)" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

# Check the AZs in the region. If greater than two use a,b,c else use the available ones
azs=$(aws ec2 --region ${REGION} describe-availability-zones| jq ".AvailabilityZones[].ZoneName" |wc -l)
echo "Found ${azs} availability zones in ${REGION}"
if [ $azs -gt 2 ]; then
  AVAILABILITY_ZONES="${REGION}a,${REGION}b,${REGION}c"
else
  AVAILABILITY_ZONES=$(aws ec2 --region ${REGION} describe-availability-zones| jq -r ".AvailabilityZones[].ZoneName"| tr '\n' ',' |sed 's/.$//')
fi

# Find out if cluster exists and update
cluster_exists=$(kops get cluster --name ${CLUSTER_NAME} --state s3://${K8S_BUCKET} | tail -1 | wc -l)

if [ "$cluster_exists" -ne "0" ]; then
  echo "Cluster exists...Moving forward"
else
  echo "Cluster not exists...Creating cluster"
  kops create cluster \
    --name $CLUSTER_NAME \
    --api-loadbalancer-type=internal \
    --associate-public-ip=false \
    --encrypt-etcd-storage \
    --master-count ${K8S_MASTER_COUNT} \
    --zones ${AVAILABILITY_ZONES} \
    --master-zones ${AVAILABILITY_ZONES} \
    --node-count ${K8S_NODE_COUNT} \
    --node-size ${K8S_NODE_INSTANCE_SIZE}\
    --master-size ${K8S_MASTER_INSTANCE_SIZE} \
    --topology private \
    --vpc $VPC_ID \
    --state s3://${K8S_BUCKET} \
    --networking $K8S_NETWORK \
    --admin-access ${VPC_CIDR} \
    --ssh-access ${VPC_CIDR} \
    --ssh-public-key $(dirname "$0")/kubernetes.pub
fi
