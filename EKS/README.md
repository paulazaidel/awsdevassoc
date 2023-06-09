# EKS

## Install kubectl
```
[nick@nuc EKS]$ sh install_kubectl_nix.sh
>>>>>   It depends on your OS/arch.  Visit the following URL and install >=1.27
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

>>>>>   Attempting install...

>>>>>   curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 46.9M  100 46.9M    0     0  7601k      0  0:00:06  0:00:06 --:--:-- 8909k

>>>>>   chmod +x kubectl

>>>>>   mkdir -p /home/nick/bin && mv ./kubectl /home/nick/bin/kubectl && export PATH=/home/nick/bin:/home/nick/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/bin:/home/nick/bb/my_linux/bin:/home/nick/bin:/opt/code/bin:/home/nick/.local/bin:/home/nick/.dotnet

>>>>>   Adding to .bashrc
```

## Install eksctl
```
[nick@nuc EKS]$ sh install_eksctl_nix.sh
>>>>>   It depends on your OS/arch.  Visit the following URL for info
https://github.com/weaveworks/eksctl/blob/main/README.md#installation

>>>>>   Attempting install...

>>>>>   curl -sLO 'https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz'

>>>>>   tar -xzf eksctl_Linux_amd64.tar.gz -C /tmp && rm eksctl_Linux_amd64.tar.gz

>>>>>   sudo mv /tmp/eksctl /usr/local/bin
[sudo] password for nick:
```

## Deploy EKS Cluster using eksctl
Note the time it takes for this to finish.  

```
```

## Configure kubectl using AWS CLI
```
```

## Deploy sample application and service
```
```

## Delete namespace
```
```

## Delete cluster
```
```

