## Overview

## Restarts the deployment
`kubcetl rollout restart deployment deployment-name -n namespace-name`

## Get all resources
`kubectl get all -A`

## Apply
Apply a configure file
`kubectl apply -f filename.yaml`

## Deployments
`kubectl get deployments`
`kubectl delete deployment <deployment-name>`

## Services
A group of pods

`kubectl get service`
`kubectl delete service <service-name>`

## Pods
Many pods make up service

`kubectl get pods`
`kubectl delete pod-name`
`kubectl describe pod-name`
`kubectl logs pod-name`
`kubectl get nodes`

## Ingress
`kubectl get ingress`
`kubectl describe ingress`
`kubectl delete ingress -n namespace ingress-name`

## Secrets
`kubectl get secrets`
`kubectl delete secret tls-secret`

## Check certificates
`kubectl describe certificate cert-name --namespace namespace`

## Helloworld nginx
```
kubectl create deployment nginx --image nginx
kubectl expose deploy/nginx --type=NodePort --port=80
kubectl get svc
curl -I localhost:32042
```
