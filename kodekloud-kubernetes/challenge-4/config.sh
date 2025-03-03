#!/bin/bash
kubectl apply -f pv-cluster.yaml
kubectl apply -f redis-cluster.yaml
kubectl apply -f redis-cluster-service.yaml
kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 {end}')
