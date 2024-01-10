#!/bin/sh

echo "removing datadog agent..."
kubectl delete deployment datadog-cluster-agent
sleep 10

kubectl get all -n datadog

echo "removing datadog operator..."
helm delete my-datadog-operator 
sleep 10 

kubectl get all -n datadog

echo "removing namespace..."
kubectl delete ns datadog

sleep 10

echo "checking namespaces..."
kubectl get ns

echo "done"