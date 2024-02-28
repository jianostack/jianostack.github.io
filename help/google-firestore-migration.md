## Before you begin
Enable billing for both projects in Google Firebase.

Create a new Google firestore database in the destination project.

## Export
Go to source project in Google Cloud console.

Create a bucket-name-export in the same region as Google Firestore database.

Run export in cloud shell:
`gcloud firestore export gs://bucket-name-export --async`

## Moving and Renaming Buckets
Go to destination project in Google Cloud console.

Create a bucket-name-import in the destination project.

Go to Data transfer and create a new transfer job.

## Import
Go to source project in Google Cloud console.

Run import in cloud shell:
```
gcloud config set project dynasty-travel
gcloud firestore import gs://bucket-name-import/2022-04-11T02:02:07_22573 --async
```

Check progress:
```
gcloud firestore operations list
```

### Resources
https://cloud.google.com/firestore/docs/manage-data/move-data
