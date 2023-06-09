# EKS

## Install kubectl

## Install eksctl

## Deploy EKS Cluster using eksctl
Note the time it takes for this to finish.  

```
[nick@nuc EKS]$ sh 2_create_cluster_eksctl.sh
!!! NOTE !!!
This creates a large amount of resources in your account, some are not free.
Press Ctrl-C to kill or enter to continue.

>>>>>   Creating managed nodes cluster in us-east-2
>>>>>   eksctl create cluster --name DeleteMeEKSCluster --region us-east-2
2023-06-09 13:35:42 [ℹ]  eksctl version 0.144.0
2023-06-09 13:35:42 [ℹ]  using region us-east-2
2023-06-09 13:35:42 [ℹ]  setting availability zones to [us-east-2b us-east-2c us-east-2a]
2023-06-09 13:35:42 [ℹ]  subnets for us-east-2b - public:192.168.0.0/19 private:192.168.96.0/19
2023-06-09 13:35:42 [ℹ]  subnets for us-east-2c - public:192.168.32.0/19 private:192.168.128.0/19
2023-06-09 13:35:42 [ℹ]  subnets for us-east-2a - public:192.168.64.0/19 private:192.168.160.0/19
2023-06-09 13:35:42 [ℹ]  nodegroup "ng-9ef053c7" will use "" [AmazonLinux2/1.25]
2023-06-09 13:35:42 [ℹ]  using Kubernetes version 1.25
2023-06-09 13:35:42 [ℹ]  creating EKS cluster "DeleteMeEKSCluster" in "us-east-2" region with managed nodes
2023-06-09 13:35:42 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup
2023-06-09 13:35:42 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-2 --cluster=DeleteMeEKSCluster'
2023-06-09 13:35:42 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "DeleteMeEKSCluster" in "us-east-2"
2023-06-09 13:35:42 [ℹ]  CloudWatch logging will not be enabled for cluster "DeleteMeEKSCluster" in "us-east-2"
2023-06-09 13:35:42 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-2 --cluster=DeleteMeEKSCluster'
2023-06-09 13:35:42 [ℹ]
2 sequential tasks: { create cluster control plane "DeleteMeEKSCluster",
    2 sequential sub-tasks: {
        wait for control plane to become ready,
        create managed nodegroup "ng-9ef053c7",
    }
}
2023-06-09 13:35:42 [ℹ]  building cluster stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:35:43 [ℹ]  deploying stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:36:13 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:36:43 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:37:44 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:38:44 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:39:45 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:40:45 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:41:46 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:42:46 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:43:47 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:44:47 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"
2023-06-09 13:45:48 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-cluster"

2023-06-09 13:47:51 [ℹ]  building managed nodegroup stack "eksctl-DeleteMeEKSCluster-nodegroup-ng-9ef053c7"
2023-06-09 13:47:52 [ℹ]  deploying stack "eksctl-DeleteMeEKSCluster-nodegroup-ng-9ef053c7"
2023-06-09 13:47:52 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-nodegroup-ng-9ef053c7"
2023-06-09 13:48:23 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-nodegroup-ng-9ef053c7"
2023-06-09 13:49:13 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-nodegroup-ng-9ef053c7"
2023-06-09 13:50:05 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster-nodegroup-ng-9ef053c7"
2023-06-09 13:50:05 [ℹ]  waiting for the control plane to become ready
2023-06-09 13:50:06 [✔]  saved kubeconfig as "/home/nick/.kube/config"
2023-06-09 13:50:06 [ℹ]  no tasks
2023-06-09 13:50:06 [✔]  all EKS cluster resources for "DeleteMeEKSCluster" have been created
2023-06-09 13:50:06 [ℹ]  nodegroup "ng-9ef053c7" has 2 node(s)
2023-06-09 13:50:06 [ℹ]  node "ip-192-168-39-55.us-east-2.compute.internal" is ready
2023-06-09 13:50:06 [ℹ]  node "ip-192-168-71-60.us-east-2.compute.internal" is ready
2023-06-09 13:50:06 [ℹ]  waiting for at least 2 node(s) to become ready in "ng-9ef053c7"
2023-06-09 13:50:06 [ℹ]  nodegroup "ng-9ef053c7" has 2 node(s)
2023-06-09 13:50:06 [ℹ]  node "ip-192-168-39-55.us-east-2.compute.internal" is ready
2023-06-09 13:50:06 [ℹ]  node "ip-192-168-71-60.us-east-2.compute.internal" is ready
2023-06-09 13:50:07 [ℹ]  kubectl command should work with "/home/nick/.kube/config", try 'kubectl get nodes'
2023-06-09 13:50:07 [✔]  EKS cluster "DeleteMeEKSCluster" in "us-east-2" region is ready
```

## Configure kubectl using AWS CLI

## Deploy sample application and service

## Delete namespace

## Delete cluster

