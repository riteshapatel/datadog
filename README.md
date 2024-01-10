## Datadog On MicroK8s

### Description

This guide details on how to deploy the `datadog operator` on a single node `microk8s`

### Secrets

Grab the `api key` from datadoghq account and create a cluster secret

```
# create datadog namespace
kubectl create ns datadog

# switch namespace
kubens datadog

# create a secret
kubectl create secret generic datadog-secret -n datadog --from-literal api-key={your_key}
```

### DataDog Operator

Deploy `datadog-operator` on to the cluster

```
# add helm repo
helm repo add datadog https://helm.datadoghq.com

# install operator via helm
helm install datadog-operator datadog/datadog-operator
```

### DataDog Agemt

```
# apply datadog agent config
kubectl apply -n datadog -f datadog-agent.yaml
```

### Shell Script

Run the shell script to install everything in one swoop!
