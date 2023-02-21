Brendan Burns 

Deployment 
Rolling Updates:
Begin

https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

1. kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml

2. To see the Deployment rollout status, run kubectl rollout status deployment/nginx-deployment.

Updating a Deployment
Let's update the nginx Pods to use the nginx:1.16.1 image instead of the nginx:1.14.2 image.
3.  kubectl set image deployment.v1.apps/nginx-deployment nginx=nginx:1.16.1
or use the following command:
kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1

kubectl set image deployment/mydeployment ngix=sss
4. kubectl edit deployment/nginx-deployment
kubectl rollout status deployment/nginx-deployment
kubectl describe deployments
kubectl rollout history deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment --revision=2

4. Rolling Back to a Previous Revision
kubectl rollout undo deployment/nginx-deployment

Rolling Back to a Previous Revision
kubectl rollout undo deployment/nginx-deployment --to-revision=2

Scaling a Deployment
kubectl scale deployment/nginx-deployment --replicas=10

End # rolling updates:


sudo docker login aksbyexampleacr.azurecr.us --username 00000000-0000-0000-0000-000000000000 --password $TOKEN

ReadinessProbe:
Login Succeeded

sudo docker login aksbyexampleacr.azurecr.us --username 00000000-0000-0000-0000-000000000000 --password  eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ilc3V1o6VzJOUDpHTUc1Ok5GUE86QU9CMjpHR1hWOkVPNkc6SjRYMjpNRU8yOlRZNFo6VDNIQTpXSFk1In0.eyJqdGkiOiJlNjJjMjNlOS1kYWE5LTRlZGQtOTY5Yy1iYTMzNDAyZDcyM2IiLCJzdWIiOiJzY2hlcnV2dUBmaWVsZGludGVybmFsdHJpYWxzLm9ubWljcm9zb2Z0LmNvbSIsIm5iZiI6MTY3NjUwNDcxMCwiZXhwIjoxNjc2NTE2NDEwLCJpYXQiOjE2NzY1MDQ3MTAsImlzcyI6IkF6dXJlIENvbnRhaW5lciBSZWdpc3RyeSIsImF1ZCI6ImFrc2J5ZXhhbXBsZWFjci5henVyZWNyLnVzIiwidmVyc2lvbiI6IjEuMCIsInJpZCI6Ijg0NjBlNDY3ZGQzYTQ2MjFhNTQ2M2QzNGM3OTM4ZjNkIiwiZ3JhbnRfdHlwZSI6InJlZnJlc2hfdG9rZW4iLCJhcHBpZCI6IjA0YjA3Nzk1LThkZGItNDYxYS1iYmVlLTAyZjllMWJmN2I0NiIsInRlbmFudCI6IjQwYTNjNDExLWIyYTctNGY3Yi1hMjhlLTA1YmY4ZGQ3YWI3YiIsInBlcm1pc3Npb25zIjp7IkFjdGlvbnMiOlsicmVhZCIsIndyaXRlIiwiZGVsZXRlIiwiZGVsZXRlZC9yZWFkIiwiZGVsZXRlZC9yZXN0b3JlL2FjdGlvbiJdLCJOb3RBY3Rpb25zIjpudWxsfSwicm9sZXMiOltdfQ.FJQX8_VhChcgaHzjoDWxVsPgtafvCIhSYkmDxPQlLapClIiVsQetrTOaousd0toXgSl1aWXvO1BBS-4AFYMAz7uMtv9S3QAggvxsx_jrrX_c3bqTJ396ojGsVF_Go3zEvfjFVCpCKA-Ls9bOgSoHEAtAmx7VhNiVFSyrnexfdRA7c4FvbBhnUAbiLPP9RzUqVPAj76JJtin4yG_P-zkXFAbYGg1-0vbuIZ9wDtdQUdgWtrCsuVPK2nDJ27mqCfCfYhp5yLTOqiIVeOHAW7gwL1a1Ba_jGGgGO-4OUscY75loQNyHTxx14Ispdjewgv9caaaj93mRr4cYmB6Kwfn2QQ

https://www.youtube.com/watch?v=aft4rlRpORI

LivenessProbes: Indicates whether a container is running
  if the check fails, the container will be restarted

  Used to verify if the application is alive or does it require a restart 
   

ReadinessProbes: Indicates whether the container is ready to serve requests.

Used to verify if the application si ready to accept the traffic.



    If the check fails, the container will not be restarted, but the Pod's IP address will be removed from the service, so it will not serve any requests anymore.
    The readiness test will make sure that at startup, the pod will only receive traffic when the test succeeds.



POD Status:

Pending
Container Creating
Running state 





POD Conditions:


Liveliness Probe:

PVC / PV Example
Begin

https://github.com/HoussemDellai/aks-file-share/tree/main/static-file-share

https://www.youtube.com/watch?v=s_ZXpuLnjJE

Houssem Dellai - MS employee 


Dynamic Provisioning 

# Deploy the Storage Class and PVC to create the Storage Account & File Share
# Dynamically create the Azure Storage Account instead of 
1. kubectl apply -f azure-file-sc.yaml 
   storageclass.storage.k8s.io/my-azurefile created
2. kubectl get storageclass   
3. kubectl get pv (Note: Persistent Volume Automatically created by Storage Class)
   pvc-e07483b3-219e-478b-90f8-40859e725ed9    
3. kubectl apply -f azure-file-pvc.yaml
   persistentvolumeclaim/my-azurefile created
4. kubectl get pvc
5. Goto --> Azure Portal --> RG: MC_aksbyexample_aksbyexample_usgovarizona --> Storage Account --> fe074a27dbb954dd5852145
6. File shares --> pod-file-share --> Empty
7. For your Pod to get access to the File shares --> It need permission/access
   Security + networking --> Access Keys 
8. Storage Account automatically create the secret for you,
  kubectl get secrets --> azure-storage-account-fe074a27dbb954dd5852145-secret 
9. kubectl get secret azure-storage-account-fe074a27dbb954dd5852145-secret -o yaml
10. kubectl apply -f app-pod.yaml
11. kubectl exec pod/nginx -it -- /bin/sh
    # From inside the Pod shell:
    # ls /mnt/azure
    # echo "Hello from Azure File Share" > /mnt/azure/myfile.txt
    # ls /mnt/azure
    # cat /mnt/azure/myfile.txt

12. Go to --> Azure Portal --> File shares --> pod-file-share --> myfile.txt --> Edit --> See the content and Add text --> Hello from Azure Cloud Storage Account --> Pod File Share. 
   # From inside the Pod shell:
     Hello from Azure Cloud Storage Account --> Pod File Share. 

13. Create a 2nd Pod try to access the Storage Account
    kubectl apply -f app-2-pod.yaml 
    kubectl exec pod/nginx-2 -it -- /bin/sh
    # From inside the Pod shell:
    # ls /mnt/azure 
    # cat /mnt/azure/myfile.txt



# CSI File Drivers: https://learn.microsoft.com/en-us/azure/aks/azure-files-csi
# src: https://docs.microsoft.com/en-us/azure/aks/azure-files-volume

Static Provisioning

1. Go to --> Azure Portal --> Storage Account -- > Create a new Storage Account
Name: staticstorageaccount
RG: MC_aksbyexample_aksbyexample_usgovarizona
2. Data storage --> File Shares --> + File Share --> static-file-share
3. Security + Networking --> Access Keys --> Copy key1
WWmIUQjS0nNbqDzYWcrQLEN+NvlOT7LdAnDJDgxdHSRzjvq5uV+88ev8RvhgDMJE/m/Q4inrzY4B+ASt6066Sg==
4. kubectl create secret generic azure-secret --from-literal=azurestorageaccountname=staticstorageaccount  --from-literal=azurestorageaccountkey=WWmIUQjS0nNbqDzYWcrQLEN+NvlOT7LdAnDJDgxdHSRzjvq5uV+88ev8RvhgDMJE/m/Q4inrzY4B+ASt6066Sg==
5. kubectl get secrets 
6. kubectl apply -f azure-file-pv.yaml
7. kubectl get pv 
8. kubectl apply -f azure-file-pvc.yaml 
   persistentvolumeclaim/azurefile created
9. kubectl get pvc
NAME           STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
azurefile      Bound    azurefile                                  5Gi        RWX                           15s
my-azurefile   Bound    pvc-e07483b3-219e-478b-90f8-40859e725ed9   5Gi        RWX            my-azurefile   99m
10. kubectl apply -f app-pod.yaml 
11. kubectl get pods
12. kubectl describe pod mypod 
    Mounts:
      /mnt/azure from azure (rw)
13. kubectl exec pod/mypod -it -- /bin/sh
    # From inside the Pod shell:
    # ls /mnt/azure
    # echo "Hello from Azure File Share-Static-Provisioning sharing" > /mnt/azure/StaticShare.txt
    # ls /mnt/azure
    # cat /mnt/azure/StaticShare.txt
14. Azure Protal --> Data storage --> File Shares --> + File Share --> static-file-share
Edit --> Hello from Azure Portal Storage Account --> Save 
15. kubectl exec pod/mypod -it -- /bin/sh
# cat /mnt/azure/StaticShare.txt






End 

Volumes / PVC Example
Begin 
kubectl debug node/aks-agentpool-31982318-vmss000001 -it --image=mcr.microsoft.com/dotnet/runtime-deps:6.0

https://learn.microsoft.com/en-us/azure/aks/node-access

1. kubectl get nodes 
2. kubectl debug node/aks-agentpool-31982318-vmss000001 -it --image=alpine
or
kubectl debug node/aks-agentpool-31982318-vmss000001 -it --image=mcr.microsoft.com/dotnet/runtime-deps:6.0

3. mkdir /mydata
4. Create a Pod with Volume path
kubectl get pods -n volumens
5. kubectl describe pod employee-producer-pod -n volumens
kubectl exec -it employee-producer-pod -n volumens bash
touch newfile.txt
echo "Hi From AKS training team" > newfile.txt
df -h (/data folder mounted)

END



ResourceLimits

kubectl create -f namespace-resourcelimit.yaml 
kubectl create -f employee-producer-pod.yaml

kubectl describe pod employee-producer-pod -n resourcelimit
Restart Count:  0
    Limits:
      cpu:     200m
      memory:  256Mi
    Requests:
      cpu:        100m
      memory:     128Mi

kubectl create -f employee-cert-pod.yaml

kubectl describe pod employee-cert-pod -n resourcelimit
    Limits:
      cpu:     400m
      memory:  1Gi
    Requests:
      cpu:        200m
      memory:     512Mi

kubectl get pods -n resourcelimit

Resources – Requests & Limits 
--> Whenever a Pod created on a Node, it consume resources like Memory, CPU and Disk Storage on the Node. 
--> Kubernetes Scheduler decide, which node the Pods needs to be created.
--> The Scheduler takes into consideration the amount of resources required by a Pod and those available on the Nodes
--> If Node don't have a sufficient Memory and CPU, the Pod don't create a Pod on that particular Node. 
--> Incase if no Node have enough resources, the Kubernetes hold back scheduling the Pods. 
--> The Event section when you describe the pod, you see the status "Insufficient CPU" error message 
--> By default Kubernetes assumes a Pod or Container within the Pod requires CPU: 0.5 and Memory: 256 Mi, this is known as a resource request for an continer. 
--> Incase if your Container/Application need more than the default allocation, you can modify the values.




# Get the resource group name of the AKS cluster 
az aks show --resource-group aksbyexample --name aksbyexample --query nodeResourceGroup -o tsv

MC_aksbyexample_aksbyexample_usgovarizona


# TEMPLATE - Create a public IP address with the static allocation
az network public-ip create --resource-group <REPLACE-OUTPUT-RG-FROM-PREVIOUS-COMMAND> --name myAKSPublicIPForIngress --sku Standard --allocation-method static --query publicIp.ipAddress -o tsv

# REPLACE - Create Public IP: Replace Resource Group value
az network public-ip create --resource-group MC_aksbyexample_aksbyexample_usgovarizona --name myAKSPublicIPForIngress --sku Standard --allocation-method static --query publicIp.ipAddress -o tsv

- Make a note of Static IP which we will use in next step when installing Ingress Controller

# Make a note of Public IP created for Ingress
52.235.153.182





52.235.153.182

http://52.235.153.182/employee
http://52.235.153.182/empcertifications

aks-helloworld-one              ClusterIP      10.0.224.250   <none>          80/TCP           36m
aks-helloworld-two              ClusterIP      10.0.236.150   <none>          80/TCP           35m

curl -L http://10.0.224.250 

kubectl delete -f hw-one.yaml --namespace ingress-basic
kubectl delete -f hw-two.yaml --namespace ingress-basic

kubectl describe service ingress-nginx-controller -n ingress-basic



BEGIN SETUP INGRESS *** 
Ingress Controller:
https://learn.microsoft.com/en-us/azure/aks/ingress-basic?tabs=azure-cli

NOTES:
The ingress-nginx controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace ingress-basic get services -o wide -w ingress-nginx-controller'

NAMESPACE=ingress-basic

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx \
  --create-namespace \
  --namespace $NAMESPACE \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz


NOTES:
The ingress-nginx controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace ingress-basic get services -o wide -w ingress-nginx-controller'

kubectl --namespace ingress get services -o wide -w ingress-nginx-controller


end - SETUP INGRESS *** 




http://52.235.145.158:8000/employee

kubectl create -f namespace-ingress.yaml




*** Ingress Controller:

https://learn.microsoft.com/en-us/azure/aks/ingress-basic?tabs=azure-cli

52.235.139.53

Stage#1: NGINX Ingress Controller Deployment in AKS Cluster



Stage# 2: Application Deployment
Step#1: Deploy services with type:<< Loadbalancer >>

kubectl create -f Ingress-employee-cert-pod.yaml 
pod/employee-cert-pod created
kubectl create -f Ingress-employee-producer-pod.yaml 
pod/employee-producer-pod created
kubectl create -f Ingress-service-employee-cert.yaml 
service/service-cert-pod created
kubectl create -f Ingress-service-employee-producer.yaml 

Step#2: Test the App
kubectl get pods -n ingress
kubectl get services -n ingress
http://<EXTERNAL-IP>:8000/employee
http://<EXTERNAL-IP>:9000/empcertifications


Step#3: Deploy services with type: << NodePort >>
kubectl apply -f Ingress-service-employee-cert.yaml 
kubectl apply -f Ingress-service-employee-producer.yaml 
kubectl apply -f ApplicationIngress.yaml 
  >> ingress.networking.k8s.io/application-ingress-service created
 
kubectl describe ingress application-ingress-service -n ingress
kubectl get Ingress -n ingress
NAME                          CLASS    HOSTS   ADDRESS          PORTS   AGE
application-ingress-service   <none>   *       52.235.153.182   80      2m35s

Test the Services with Ingress Public IP: No need to specify the Services Port. 

http://52.235.153.182/employee
http://52.235.153.182/empcertifications



****



kubectl --namespace ingress get services -o wide -w employee-ingress-controller


http://<EXTERNAL-IP>/employee
http://<EXTERNAL-IP>/empcertifications
http://52.235.153.182/employee
http://52.235.153.182/empcertifications


A reverse proxy server is a type of proxy server that typically sits behind the firewall in a private network and directs client requests to the appropriate backend server.

https://traefik.io/blog/reverse-proxy-vs-ingress-controller-vs-api-gateway/#:~:text=In%20a%20nutshell%2C%20an%20ingress,balancer%20for%20the%20said%20cluster.




Team,
 
Please find attached AKS training course contents. Below are the AKS training prerequisite,

1. Understand Containerization
2. Basics of Docker 

Thank you,
BC.






http://employee-cert-pod:9000/empcertifications



http://service-cert-pod.sales.svc.cluster.local:9000/empcertifications
::namespace folder


Namespace: Marketing
kubectl get pods -n marketing
kubectl exec -it employee-producer-marketing -n marketing bash
root@employee-producer-marketing:/#  <run below command>
curl http://service-cert-pod.sales.svc.cluster.local:9000/empcertifications
 
Namespace: Sales
kubectl get pods -n sales
kubectl exec -it employee-cert-pod -n sales bash
root@employee-cert-pod:/#  <run below command>
curl http://service-employee-producer-pod.marketing.svc.cluster.local:8000/employee




kubectl exec employee-producer-marketing -i -t -- bash
kubectl exec -it employee-producer-marketing bash





kubectl create -f namespace-sales.yaml 
kubectl get ns
kubectl create -f employee-cert-pod.yaml 
kubectl create -f service-employee-cert.yaml 
kubectl get services -n sales





Namespaces allow to split-up resources into different groups.
Resource names should be unique in a namespace
Create multiple environments like dev, staging and production etc
Kubernetes will always list the resources from default namespace.

Namespace: 

kubectl create -f namespace-marketing.yaml 
kubectl get namespaces
or
kubectl get ns 
kubectl delete namespace marketing

Pod:
kubectl create -f employee-producer-pod.yaml
kubectl get pods
kubectl get pods -namespace marketing
kubectl get pods -n marketing

kubectl get all
kubectl get all -n marketing

# Get all from All Namespaces
kubectl get all -all-namespaces









Network Policy:
https://docs.giantswarm.io/getting-started/network-policies/

Namespace, role-binding.yaml, Roles. 
https://www.middlewareinventory.com/wp-content/uploads/2022/11/Screenshot-2022-11-27-at-2.29.11-PM-scaled.jpg

 
*** Full Kubernetes Tutorial - HPA 
Begin 
https://stacksimplify.com/azure-aks/azure-kubernetes-service-namespaces-imperative/
All Courses:
https://stacksimplify.com/azure-aks/courses/stacksimplify-best-selling-courses-on-udemy/

https://stacksimplify.com/azure-aks/azure-kubernetes-service-pod-autoscaler/

Code Base:
https://github.com/stacksimplify/azure-aks-kubernetes-masterclass/tree/master/22-Azure-AKS-Autoscaling/22-02-Azure-AKS-HPA-Horizontal-Pod-Autoscaler/kube-manifests
 

https://github.com/stacksimplify/azure-aks-kubernetes-masterclass

End




kubectl create -f AppSecrets.yaml
kubectl describe secret oracle-database-secret

kubectl create -f AppSecrets-pod.yaml
kubectl get pods
kubectl describe pod frontend-pod-secret




echo -n 'PlatformOne.DOD.com:7643/ironbankdb' | base64
UGxhdGZvcm1PbmUuRE9ELmNvbTo3NjQzL2lyb25iYW5rZGI=

echo -n 'azure' | base64
YXp1cmU=

echo -n 'stack' | base64
c3RhY2s=




kubectl create -f AppConfigMap.yaml

        envFrom:
         - configMapRef:
              name: app-config 



Replication Controller and Replica SET 
Begin

Now we know how to create a Pod and Service. 
Three important things are missing

1. High Availability: defined as characteristic of a system which aims to ensure an agreed level of operational performance, usually uptime, for a higher-than-normal period.
2. Scalability: defined as the property of a system to handle a growing amount of work by adding resources to the system.
3. Resiliency: defined as the ability of a system to recover from failures and continue to function.

Introduce 2 Kubernetes Features:
Replication Controller and Replica SET
RC is a older technology, replaced by ReplicaSet 
Going forward you are going to use RS



Single Pod Employee-Producer running
Some reason, pod failed and users are not able to access the application/service 
Prevent users from losing access to the application/service, we like to have more than one instance POD running at the same time.
Incase One Pod Fails, we have another Pod running and servicing the customer/user
Replication Set/Controller take care to run multiple instances of the Pod running in the kuberntes customer .
which covers the High availability. 
Even if you have a single pod
Can I use the Replication Set/Controller incase if I have a single Pod ?.  No, you can use RC/RS to even if you have a single Pod.  Even if you have a single Pod, the RC/RS can bring a create a new pod when the existing one failed.  
The specified number of pods will be running all the times. 



End 


Imagepullpolicy 
https://www.containiq.com/post/kubernetes-image-pull-policy

https://stackoverflow.com/questions/42494853/standard-init-linux-go178-exec-user-process-caused-exec-format-error

Kubernetes objects can quickly be created, updated, and deleted directly using imperative commands 

kubectl run nginx --image=nginx --restart=Never

employee-producer-pod

kubectl exec -it employee-producer-pod bash


Service:
MicroService#1 
kubectl create -f service-employee-producer.yaml 
kubectl get services
kubectl describe service service-employee-producer-pod
http://<EXTERNAL-IP>:8000/employee

MicroService#2 
kubectl create -f service-employee-cert.yaml 
kubectl get services
kubectl describe service service-cert-pod 
http://<EXTERNAL-IP>:9000/empcertifications

<EXTERNAL-IP> = Load Balancer IP






CERT

Intel:
docker tag employee-cert:1.0 aksbyexampleacr.azurecr.us/employee-cert:1.0
docker push aksbyexampleacr.azurecr.us/employee-cert:1.0
az acr repository list --name aksbyexampleacr 
Verify in Azure Portal --> ACR --> Repositories

ARM:
docker build --platform=linux/amd64 -t employee-cert:1.0-amd64 .
docker images
docker tag employee-cert:1.0-amd64 aksbyexampleacr.azurecr.us/employee-cert:1.0-amd64
docker push aksbyexampleacr.azurecr.us/employee-cert:1.0-amd64
az acr repository list --name aksbyexampleacr 
Verify in Azure Portal --> ACR --> Repositories



Intel:
docker build --platform=linux/amd64 -t employee-producer:1.0-amd64 .
docker images
docker tag employee-producer:1.0 aksbyexampleacr.azurecr.us/employee-producer:1.0
docker push aksbyexampleacr.azurecr.us/employee-producer:1.0
az acr repository list --name aksbyexampleacr 
Verify in Azure Portal --> ACR --> Repositories

ARM:
docker build --platform=linux/amd64 -t employee-producer:1.0-amd64 .
docker images
docker tag employee-producer:1.0-amd64 aksbyexampleacr.azurecr.us/employee-producer:1.0-amd64
docker push aksbyexampleacr.azurecr.us/employee-producer:1.0-amd64
az acr repository list --name aksbyexampleacr 
Verify in Azure Portal --> ACR --> Repositories




docker build -t employee-cert:1.0 .
docker images

kubectl delete pod employee-producer-pod


az acr login --name aksbyexampleacr

sudo docker login aksbyexampleacr.azurecr.us --username 00000000-0000-0000-0000-000000000000 --password $TOKEN

TOKEN=$(az acr login --name aksbyexampleacr.azurecr.us --expose-token --output tsv --query accessToken)
echo $TOKEN
docker login aksbyexampleacr.azurecr.us --username 00000000-0000-0000-0000-000000000000 --password $TOKEN



“Electronic Freedom of Information Act (eFOIA) is a web application developed for hosting in Azure Government’s IL4 environment. The eFOIA application is a 100% COTS product that tracks FOIA submissions from the public to FOIA Offices across the Air Force. 830 users (FOIA Managers) across the Air Force to utilize eFOIA to redact and track capabilities to field FOIA requests from the public in order to remain in compliance with Federal regulations. eFOIA leverages the following Azure Infrastructure as a Services (IaaS) to host the FOAIXpress COTS product: Windows OS (R2), App Server (R2, IIs & .NET), Web App Server (R2) and a SQL Database (FX & PAL 2014). If you’d like to learn more about eFOIA please contact Alaina Eagle, eFOIA CDM 

eFOIA TechStack Details:
App Type: WebApplication
Env: IL4
OS: Windows OS (R2)
App Server: (R2, IIs & .NET) & Web App Server (R2)
Database: SQL Database (FX & PAL 2014)


Introduction:

Bharadwaja Cheruvu
Holds TS/SCI with PolyGraph. 
Living in Frisco, Texas. 
Joined Microsoft 2 years back. Sr. Cloud Solution Architect in CSU App Innovation team, primarily works on AKS, DOD CloudOne & PlatformOne.  One of the lead for DevSecOps Federal SWAT Team. 
Previously worked for
Verizon Wireless 18 years as a Development team Manager for eCommerce Digital Online Development team
Raytheon Technologies worked on AWS, OpenStack highly classified projects. 
Lockheed Martin for Chief Cloud Architect, developed many Mission critical Kubernetes application which runs on F-35 flight. 



