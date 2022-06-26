#!/bin/bash

# Function which takes a namespace, retry seconds and waits until ip is assigned to it.
function wait_for_ip() {
    namespace=$1
    sleep_seconds=$2
    while [ -z $ip ]; do
        echo "Waiting for Ingress Address IP"
        ip=$(kubectl get ingress -n $namespace -o jsonpath="{.items[*].status.loadBalancer.ingress[*].ip}")
        [ -z "$ip" ] && sleep sleep_seconds
    done
    echo 'Found Ingress Address IP'
    url=$(kubectl get ingress -n $namespace -o jsonpath="{.items[*].spec.rules[*].host}")
    echo 'Visit https://'$url' in your browser'
}

wait_for_ip $1 $2