kubectl apply -f plate-detection-deployment.yaml
kubectl apply -f plate-detection-service.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml
kubectl apply -f ingress.yaml