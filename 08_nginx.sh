helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm repo update

helm repo add stable https://charts.helm.sh/stable 



helm install nginx-ingress ingress-nginx/ingress-nginx \
 --namespace ingress-demo \
 --set controller.replicaCount=2 \
 --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
 --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux \
 --set controller.admissionWebhooks.patch.nodeSelector."beta\.kubernetes\.io/os"=linux


kubectl get svc --namespace ingress-demo

