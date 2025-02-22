#!/bin/bash
kubectl apply -f *.yaml
kubectl config set-context --user=martin --cluster=kubernetes