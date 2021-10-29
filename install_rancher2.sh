helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.hjlsvr.net\
  --set replicas=2
