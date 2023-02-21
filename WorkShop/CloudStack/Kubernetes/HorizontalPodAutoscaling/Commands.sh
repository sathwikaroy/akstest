
Monitor HPA
1. kubectl get hpa hpa-demo-declarative -w
2. kubectl get deployments -w
3. kubectl get pods -w 
4. kubectl run apache-bench -i --tty --rm --image=httpd -- ab -n 500000 -c 1000 http://hpa-demo-service-nginx.default.svc.cluster.local/

kubectl delete hpa hpa-demo-declarative -n hpa

kubectl apply -f employee-producer-deployment.yaml
kubectl apply -f service-employee-producer.yaml
Test the app: http://52.235.154.185:8000/employee

kubectl apply -f hpa.yaml

kubectl get deployment -n hpa 
kubectl describe deployment employee-producer-deployment -n hpa
kubectl get horizontalpodautoscaler.autoscaling/hpa-demo-declarative -n hpa
kubectl get horizontalpodautoscaler.autoscaling/hpa-demo-declarative -n hpa -w   



kubectl run apache-bench -i --tty --rm --image=httpd -- ab -n 500000 -c 1000 http://service-employee-producer-pod.hpa.svc.cluster.local/ 

kubectl get hpa -n hpa

kubectl get hpa employee-producer-hpa-deployment -n hpa

kubectl get pods -n hpa

Cooldown / Scaledown
- Default cooldown period is 5 minutes. 
- Once CPU utilization of pods is less than 20%, 
  it will starting terminating pods and will reach to minimum 2 pod as configured.

