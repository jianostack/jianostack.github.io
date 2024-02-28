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

## Check certificates

`kubectl describe certificate cert-name --namespace namespace`


```
kubectl create deployment nginx --image nginx
kubectl expose deploy/nginx --type=NodePort --port=80
kubectl get svc
NAME       TYPE           CLUSTER-IP        EXTERNAL-IP    PORT(S)
nginx      NodePort       192.168.194.217   <none>         80:32042/TCP

curl -I localhost:32042
HTTP/1.1 200 OK
Server: nginx/1.25.2
```

Services:
- group of pods

Pods:
- like ECS tasks

Helm
- like docker-compose

