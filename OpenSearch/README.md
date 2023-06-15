# Amazon OpenSearch Service

## CLI Examples

### Create Managed Cluster Domain with defaults
```
Mac-2:~ nick$ aws opensearch create-domain --domain-name adgudomain --ebs-options "EBSEnabled=true,VolumeSize=20"
{
    "DomainStatus": {
        "DomainId": "146868985163/adgudomain",
        "DomainName": "adgudomain",
        "ARN": "arn:aws:es:us-east-2:146868985163:domain/adgudomain",
        "Created": true,
        "Deleted": false,
        "Processing": true,
        "UpgradeProcessing": false,
        "EngineVersion": "OpenSearch_2.5",
        "ClusterConfig": {
            "InstanceType": "m4.large.search",
            "InstanceCount": 1,
            "DedicatedMasterEnabled": false,
            "ZoneAwarenessEnabled": false,
            "WarmEnabled": false,
            "ColdStorageOptions": {
                "Enabled": false
            },
            "MultiAZWithStandbyEnabled": false
        },
        "EBSOptions": {
            "EBSEnabled": true,
            "VolumeType": "gp2",
            "VolumeSize": 20
        },
        "AccessPolicies": "",
        "SnapshotOptions": {
            "AutomatedSnapshotStartHour": 0
        },
        "CognitoOptions": {
            "Enabled": false
        },
        "EncryptionAtRestOptions": {
            "Enabled": false
        },
        "NodeToNodeEncryptionOptions": {
            "Enabled": false
        },
        "AdvancedOptions": {
            "override_main_response_version": "false",
            "rest.action.multi.allow_explicit_index": "true"
        },
        "ServiceSoftwareOptions": {
            "CurrentVersion": "",
            "NewVersion": "",
            "UpdateAvailable": false,
            "Cancellable": false,
            "UpdateStatus": "COMPLETED",
            "Description": "There is no software update available for this domain.",
            "AutomatedUpdateDate": 0.0,
            "OptionalDeployment": true
        },
        "DomainEndpointOptions": {
            "EnforceHTTPS": false,
            "TLSSecurityPolicy": "Policy-Min-TLS-1-0-2019-07",
            "CustomEndpointEnabled": false
        },
        "AdvancedSecurityOptions": {
            "Enabled": false,
            "InternalUserDatabaseEnabled": false,
            "AnonymousAuthEnabled": false
        },
        "AutoTuneOptions": {
            "State": "DISABLED",
            "UseOffPeakWindow": false
        },
        "ChangeProgressDetails": {
            "ChangeId": "2fed5cea-1eb9-4c00-b47e-dd9551556836"
        },
        "OffPeakWindowOptions": {
            "Enabled": true,
            "OffPeakWindow": {
                "WindowStartTime": {
                    "Hours": 2,
                    "Minutes": 0
                }
            }
        },
        "SoftwareUpdateOptions": {
            "AutoSoftwareUpdateEnabled": false
        }
    }
}
```

### Create Serverless Collection
```
```

 
### List Managed Cluster Domains
```
Mac-2:~ nick$ aws opensearch list-domain-names
{
    "DomainNames": [
        {
            "DomainName": "adgudomain",
            "EngineType": "OpenSearch"
        }
    ]
}
```


### List Serverless Collections
```
Mac-2:~ nick$ aws opensearchserverless list-collections --region us-east-1
{
    "collectionSummaries": [
        {
            "arn": "arn:aws:aoss:us-east-1:146868985163:collection/op127cr3yokl8v5vpgif",
            "id": "op127cr3yokl8v5vpgif",
            "name": "deletemecollection",
            "status": "ACTIVE"
        }
    ]
}
```
