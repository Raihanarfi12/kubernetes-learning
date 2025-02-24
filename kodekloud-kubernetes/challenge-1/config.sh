#!/bin/bash
kubectl apply -f developer-role.yaml
kubectl apply -f developer-role-binding.yaml
kubectl apply -f jekyll-pvc.yaml
kubectl apply -f jekyll.yaml
kubectl apply -f jekyll-node-services.yaml
kubectl config set-credentials martin --client-key=/root/martin.key --client-certificate=/root/martin.crt --embed-certs=false
kubectl config set-context developer --cluster=kubernetes --user=martin

