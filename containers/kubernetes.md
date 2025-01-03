## Installing Kubernetes 
Option 1 Kubernetes on your Mac:
- OrbStack (kubernetes, kubectl, docker and VMs)
- orbstack.dev
Option 2 kubectl command line:
- brew install kubectl

## Connect your local kubectl to EKS
`aws eks update-kubeconfig --region region-code --name my-cluster`

## Memory & CPU
kubectl top pod -l app=label-name -n namespace

## Memory Average
kubectl get pods -l app=labelname--namespace=namespace --no-headers=true | awk '{print $1}' | xargs -I {} kubectl top pod {} --namespace=namespace --use-protocol-buffers | awk '{sum+=$3} END {print sum/NR}'

## Autoscaling
kubectl get hpa -n namespace

kubectl describe hpa hpa-name -n namespace

kubectl apply -f filename.yaml -n namespace

## Delete Apply

kubectl delete hpa hpa-name -n namespace

kubectl apply -f hpa-name -n namespace

kubectl delete -f deployment-file.yaml -n namespace

kubectl apply -f deployment-file.yaml -n namespace

## Deployments

kubectl get deployments -n namespace

## Rollout

kubectl set image deployment/deployment-name container-name=url -n namespace

kubectl rollout status deployment/deployment-name -n namespace

kubectl describe deployment deployment-name -n namespace

kubectl rollout undo deployment/deployment-name -n namespace

kubectl rollout history deployment/deployment-name -n namespace

kubectl get deployment/deploymentname -o=jsonpath='{.spec.replicas}' -n namespace

kubectl rollout restart deployment deployment-name -n namespace

## Services

kubectl get service

kubectl delete service <service-name>

## Pods
```
kubectl get pods -A
kubectl get pods
kubectl describe pod-name
kubectl delete pod-name
```

## Ingress
`kubectl get ingress`
`kubectl describe ingress`
`kubectl delete ingress -n namespace ingress-name`
`kubectl get ingress --show-labels -n name-space`

## Secrets
`kubectl get secrets`
`kubectl delete secret tls-secret`

## Logs
`kubectl logs -l app=label-in-yaml -n namespace -f --max-log-requests 30`

## Nodes
`kubectl get nodes`

## Copy
`kubectl cp pod-name:/file/path/inside/pod . -n namespace`

## Exec
`kubectl exec -it pod-name ash -n namespace`

## Config
```
kubectl config current-context
kubectl config get-contexts 
kubectl config set-context --current --namespace=
```

## Create a new namespace 
`kubectl create namespace my-namespac`
