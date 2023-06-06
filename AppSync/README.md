# AppSync
This example uses an AppSync GraphQL API to front-end data query and manipulation in a DynamoDB table.

## Table Creation
This example requires a DynamoDB table.  The 1_create_table.py script can be used to create the table.
```
$ python3 1_create_table.py 

> Current tables
    CarsNE1
    Olympics
    TestGlobal
    people
    student

> Creating table
    Created table ARN: arn:aws:dynamodb:us-east-2:146868985163:table/AppSyncTest

> Waiting for table state: ACTIVE
    Check 0: CREATING
    Check 1: CREATING
    Check 2: CREATING
    Check 3: CREATING
    Check 4: CREATING
    Check 5: ACTIVE

> Inserting 1 item into AppSyncTest
    The item:
    {"id": {"N": "1"}, "make": {"S": "Mazda"}, "model": {"S": "RX-7"}, "year": {"N": "1982"}}

> Scanning table for count
    1 item(s) in the new table:
    {"model": {"S": "RX-7"}, "year": {"N": "1982"}, "id": {"N": "1"}, "make": {"S": "Mazda"}}

$
```
