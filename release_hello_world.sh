# For each yaml file in these directories [Namespaces, Deployments, Services, Ingresses] (named hello_*) , apply them to the cluster.
for yaml_file in $(find Namespaces Deployments Services Ingresses -name "hello_*" -type f); do
    kubectl apply -f $yaml_file
done
echo "Hello World app deployed on the cluster!"