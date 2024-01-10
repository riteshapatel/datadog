#!/bin/sh

echo "setting up namespaces..."
kubectl delete ns datadog
kubectl create ns datadog 

echo "switching namespace to datadog..."
kubens datadog

echo "adding helm repository..."
helm repo add datadog https://helm.datadoghq.com

echo "installing datadog operator..."
helm install my-datadog-operator datadog/datadog-operator

echo "creating datadog secret..."
kubectl create secret generic datadog-secret --from-literal api-key={your_key}

echo "creating datadog agent..."
kubectl apply -f datadog-agent.yaml -n datadog

echo "checking datadog resources..."
kubectl get all -n datadog

echo "done!"