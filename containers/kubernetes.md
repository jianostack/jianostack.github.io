## Overview

## Configure kubectl 
To point to point a server
`aws eks update-kubeconfig --region region-code --name my-cluster`

## Get all resources
`kubectl get all -A`

## Apply
Apply a configure file
`kubectl apply -f filename.yaml -n namespace`

## Deployments
`kubectl set image deployment/deployment-name container-name=url -n namespace`
`kubectl rollout status deployment/deployment-name -n namespace`
`kubectl get deployments`
`kubectl describe deployment deployment-name -n namespace`
`kubectl rollout undo deployment/deployment-name -n namespace`
`kubectl rollout history deployment/deployment-name -n namespace`

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

## Restarts
`kubectl rollout restart deployment om-navmiddleware-deployment -n omi-prd`

## Logs
`kubectl logs -l app=label-in-yaml -n omi-prd -f --max-log-requests 30`
