## Overview

All resource all namespaces
`kubectl get all -A`

## Deployments

`kubectl get deployments`
`kubectl delete deployment <deployment-name>`

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

`kubectl get service`
`kubectl delete service <service-name>`

## Secrets

`kubectl get secrets`
`kubectl delete secret tls-secret`

Check certificates

`kubectl describe certificate cert-name --namespace namespace`
