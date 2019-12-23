## Overview

All resource all namespaces

`kubectl get all -A`

Kubernetes delete

```
kubectl delete deployment <deployment-name>
kubectl delete ingress <ingress-name>
kubectl delete service <service-name>
```

## Deployments

`kubectl get deployments`

## Pods

`kubectl get pods`
`kubectl delete pod-name`
`kubectl describe pod-name`
`kubectl logs pod-name`
`kubectl get nodes`

## Ingress

`kubectl get ingress`
`kubectl describe ingress`
`kubectl delete ingress -n namespace ingress-name`

## Services

kubectl get service

## Secrets

`kubectl get secrets`

`kubectl delete secret tls-secret`

Check certificates

`kubectl describe certificate cert-name --namespace namespace`
