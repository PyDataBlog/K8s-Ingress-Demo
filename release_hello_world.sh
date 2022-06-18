kubectl apply -f Namespaces/hello_namespace.yaml && \
kubectl apply -f Deployments/hello_deployment.yaml && \
kubectl apply -f Services/hello_service.yaml && \
kubectl apply -f Ingresses/hello_ingress.yaml && \
echo "Hello World! I'm deployed on Kubernetes!"