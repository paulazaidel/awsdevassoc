# EKS

## Configure kubectl using AWS CLI

### Get Cluster Name
```
$ aws eks list-clusters
{
    "clusters": [
        "DeleteMeEKSCluster"
    ]
}
```

### Configure kubeconfig
```
$ aws eks update-kubeconfig --name DeleteMeEKSCluster
Added new context arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster to /Users/nick/.kube/config
```

### Verify
```
$ ./kubectl get pods --all-namespaces
NAMESPACE     NAME                       READY   STATUS    RESTARTS   AGE
kube-system   coredns-647484dc8b-6qtwp   0/1     Pending   0          51m
kube-system   coredns-647484dc8b-mvwcv   0/1     Pending   0          51m

$ ./kubectl config view
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: DATA+OMITTED
    server: https://42E90778CEF986332C7F145899BF12DE.gr7.us-east-2.eks.amazonaws.com
  name: arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster
contexts:
- context:
    cluster: arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster
    user: arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster
  name: arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster
current-context: arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster
kind: Config
preferences: {}
users:
- name: arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - --region
      - us-east-2
      - eks
      - get-token
      - --cluster-name
      - DeleteMeEKSCluster
      command: aws
      env: null
      interactiveMode: IfAvailable
      provideClusterInfo: false
```

## Deploy hello-node
```
$ ./kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost netexec --http-port=8080
deployment.apps/hello-node created

$ ./kubectl get deployments
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
hello-node   0/1     1            0           24s

$ ./kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
hello-node-7579565d66-vk2b7   0/1     Pending   0          43s

$ ./kubectl get events
LAST SEEN   TYPE      REASON              OBJECT                             MESSAGE
56s         Warning   FailedScheduling    pod/hello-node-7579565d66-vk2b7    no nodes available to schedule pods
56s         Normal    SuccessfulCreate    replicaset/hello-node-7579565d66   Created pod: hello-node-7579565d66-vk2b7
56s         Normal    ScalingReplicaSet   deployment/hello-node              Scaled up replica set hello-node-7579565d66 to 1
```

## Expose hello-node
```
Mac-2:~ nick$ ./kubectl get services
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   54m


```
