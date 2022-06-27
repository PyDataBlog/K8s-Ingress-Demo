# For each yaml file in these directories [Namespaces, Deployments, Services, Ingresses] (named hello_*) , apply them to the cluster.
for yaml_file in $(find Namespaces Deployments Services Ingresses -name "hello_*" -type f); do
    kubectl apply -f $yaml_file
done
echo "Hello World app deployed on the cluster!"

ip=""
while [ -z $ip ]; do
    echo "Waiting for external IP"
    ip=$(kubectl get ingress -n ingress-demo -o jsonpath="{.items[*].status.loadBalancer.ingress[*].ip}")
    [ -z "$ip" ] && sleep 5
done

echo 'Found external Ingress IP'
url=$(kubectl get ingress -n ingress-demo -o jsonpath="{.items[*].spec.rules[*].host}")
echo 'Visit https://'$url' in your browser'