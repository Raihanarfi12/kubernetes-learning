#!/bin/bash
#change server name of controlplane
sed -i 's|server: https://[^:]*:[0-9]*|server: https://controlplane:6443|' /root/.kube/config
#change certificate name for CA of kubeapi-server
sed -i 's|--client-ca-file=/etc/kubernetes/pki/ca-authority.crt|--client-ca-file=/etc/kubernetes/pki/ca.crt|' /etc/kubernetes/manifests/kube-apiserver.yaml
systemctl restart kubelet
kubectl set image deployment/coredns -n kube-system coredns=registry.k8s.io/coredns/coredns:v1.8.6

#change node01 status to schedulable or uncordon
kubectl uncordon node01

#copy file from controlplane /media path to node01 /web path
scp /media/* node01:/web

kubectl apply -f data-pv.yaml
kubectl apply -f data-pvc.yaml
kubectl apply -f gop-file-server.yaml
kubectl apply -f gop-fs-service.yaml