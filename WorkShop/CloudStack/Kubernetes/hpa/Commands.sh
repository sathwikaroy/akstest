
Lab Folder: WorkShop/CloudStack/Kubernetes/hpa

Deploy the HPA App:
kubectl apply -f 01-nginx-app.yml
kubectl apply -f hpa-manifest.yml 
Test the App: 
http://52.235.139.249:8000/employee


Monitor HPA:
1. kubectl get hpa hpa-demo-declarative -w
2. kubectl get deployments -w
3. kubectl get pods -w 
4. kubectl run apache-bench -i --tty --rm --image=httpd -- ab -n 500000 -c 1000 http://hpa-demo-service-nginx.default.svc.cluster.local:8000/kubectl run apache-bench -i --tty --rm --image=httpd -- ab -n 500000 -c 1000 http://hpa-demo-service-nginx.default.svc.cluster.local:8000/

Deploy the HPA App:
kubectl delete hpa hpa-demo-declarative
kubectl delete deployment hpa-demo-deployment 
kubectl delete service hpa-demo-service-nginx 


Cooldown / Scaledown
- Default cooldown period is 5 minutes. 
- Once CPU utilization of pods is less than 20%, 
  it will starting terminating pods and will reach to minimum 2 pod as configured.

