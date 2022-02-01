#!/bin/bash

# Define default values
DEFAULT_CLUSTER_ENV=devops-1-nonprod
DEFAULT_LABEL=-ljenkins=slave

# Take ENV vars or Use default values
CLUSTER_ENV=${CLUSTER_ENV:-$DEFAULT_CLUSTER_ENV}
LABEL=${LABEL:-$DEFAULT_LABEL}
URL=https://kubernetes.docker.internal:6443

# Get a list of pods that match the provided labels
pods=$(kubectl get pods -A   | awk '$4 == "Running" {name = $2; namespace =$1; print "oc delete pod " name " -n " namespace" &";}')

for i in ${pods}
do
  echo $i
done
#evictedPods=$(kubectl get pods -A | awk '$4 == "Running" {print $1 "|" $2}')

# Loop through evicted pods and delete them
#for pod in $evictedPods; do
#  IFS='|' read namespace evictedPod <<< "$pod";
#  kubectl -n $namespace delete pod $evictedPod;
#  sleep 0.25
#  echo $IFS
#done


