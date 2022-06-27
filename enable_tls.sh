if kubectl create secret -n kube-system tls mkcert-tls-secret --cert=Secrets/_wildcard.myminikube.demo+2.pem --key=Secrets/_wildcard.myminikube.demo+2-key.pem ; then
    echo "TLS secret created"
else
    echo "TLS secret already exists?"
    exit 1
fi && \
minikube addons configure ingress <<< "kube-system/mkcert-tls-secret" && \
minikube addons disable ingress && \
minikube addons enable ingress