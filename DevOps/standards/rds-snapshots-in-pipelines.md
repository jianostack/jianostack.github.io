<!-- Space: DOS -->
<!-- Parent: Standards -->

# RDS Snapshots in pipelines

RDS database snapshots are now taken during the build stage of the production pipelines. It will be stored on AWS until a user removes it. DB migrations for Laravel and ExpressJS will always be forced for production now.

CodeBuild buildspec.yaml

```
version: 0.2

phases:
  build:
    commands:
      - aws rds create-db-snapshot --db-instance-identifier name-of-dbinstance --db-snapshot-identifier name-of-dbinstance-$CODEBUILD_START_TIME
      # - aws rds create-db-cluster-snapshot --db-cluster-identifier name-of-cluster --db-cluster-snapshot-identifier name-of-cluster-$CODEBUILD_START_TIME
```

## Restoring RDS snapshots
Snapshots are taken of the entire RDS instance. The snapshot can be restored back into the same VPC with all the network settings intact. 

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RestoreFromSnapshot.html#USER_RestoreFromSnapshot.Restoring
