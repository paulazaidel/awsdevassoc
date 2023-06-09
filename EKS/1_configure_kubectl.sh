#!/bin/sh
echo ">>>>>   Listing Clusters"
echo ">>>>>   aws eks list-clusters"
aws eks list-clusters
echo

echo ">>>>>   Enter cluster name: "
read cluster
echo

echo ">>>>> aws eks update-kubeconifg --name $cluster"
aws eks update-kubeconfig --name $cluster
echo


echo ">>>>> Verify, assuming kubectl is in the path"
kubectl get pods --all-namespaces
