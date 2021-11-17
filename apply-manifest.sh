kubectl apply -f plate-detection-deployment.yaml
kubectl apply -f plate-detection-service.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service.yaml
kubectl apply -f ingress.yaml