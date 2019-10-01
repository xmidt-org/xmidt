# Deploying XMiDT With Kubernetes

## Kubernetes

Make sure you have a Kubernetes cluster ready.    
You can either use:
* [minikube](https://kubernetes.io/docs/setup/learning-environment/minikube/)
* [kind](https://github.com/kubernetes-sigs/kind)
* or a cluster provided by a cloud provider

In order to deploy to Kubernetes (k8s), you need to setup kubectl to talk to your cluster.    

## Prerequisites 
xmidt cloud components are deployed using a helm chart. Helm charts enables us to describe dependencies to 3rd party services like Consul or Prometheus.
Make sure [helm](https://github.com/helm/helm) >= v3.0.0-beta.3 is installed on your system. [helm-quickstart](https://v3.helm.sh/docs/intro/quickstart/)

If you need to make customisation (e.g. because of unique characteristics of your k8s instance) [ship](https://github.com/replicatedhq/ship) is recommended

## Getting Started
Use helm to render the chart to *rendered.yaml*:
```
helm template xmidt-cloud ./xmidt-cloud/ > rendered.yaml
```

Now you can deploy the rendered chart to your k8s cluster:
```
kubectl apply -f rendered.yaml
```

Check if all pods are running (scytale might need a couple of restarts as it depends on consul):
```
kubectl get all
--
pod/caduceus-0                  1/1       Running   0          5d
pod/home-gateway-service-0      1/1       Running   0          22h
pod/petasos-0                   1/1       Running   0          5d
pod/prometheus-0                1/1       Running   0          5d
pod/rdkb-simulator-0            1/1       Running   0          5d
pod/scytale-0                   1/1       Running   4          5d
pod/talaria-0                   1/1       Running   0          5d
pod/tr1d1um-0                   1/1       Running   0          5d
pod/xmidt-cloud-consul-0        1/1       Running   0          5d
pod/xmidt-cloud-consul-1        1/1       Running   0          5d
pod/xmidt-cloud-consul-2        1/1       Running   0          5d
```

To get the ports for tr1d1um and petasos use:
```
kubectl get all | grep 'service/tr1d1um-nodeport\|service/petasos-nodeport'
--
service/petasos-nodeport NodePort 10.247.241.180 <none>  6400:32659/TCP                                                                     3m
service/tr1d1um-nodeport NodePort 10.247.63.209  <none>  6100:31425/TCP 
```
It means you can access tr1d1um on port 31425 and petasos on port 32659 on each node of your cluster.


## Delete
You can delete your deployment with:
```
kubectl delete -f rendered.yaml
```

## FAQ

1. Consul pods are not running
Consul depends on a PerstentVolumeClaim, make sure your k8s instance supports this.    
You may also have to add annotations to the PerstentVolumeClaim section.
If this is the case use [ship](https://github.com/replicatedhq/ship) to customize the xmidt helm chart.