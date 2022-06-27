#!/bin/bash

# Function which takes a namespace, and waits until ip is assigned to it.
function wait_for_ip() {
    namespace=$1
    echo "Waiting for IP for namespace: $namespace"
    while [ -z $ip ]; do
        ip=$(kubectl get ingress -n $namespace -o jsonpath="{.items[*].status.loadBalancer.ingress[*].ip}")
        [ -z "$ip" ]
    done
    echo 'Found Ingress Address IP'
    url=$(kubectl get ingress -n $namespace -o jsonpath="{.items[*].spec.rules[*].host}")
    echo 'Visit https://'$url' in your browser'
}

wait_for_ip $1