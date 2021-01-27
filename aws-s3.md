# S3 copy objects to another bucket

`aws s3 sync s3://SOURCE_BUCKET_NAME s3://NEW_BUCKET_NAME`

https://aws.amazon.com/premiumsupport/knowledge-center/move-objects-s3-bucket/

# How can I copy S3 objects from another AWS account

https://aws.amazon.com/premiumsupport/knowledge-center/copy-s3-objects-account/

# S3 Create a bucket
While creating the bucket there are two kinds of access, ACL and policies.

ACL deals with Amazon account access and policies cover the rest.

You can skip ACL and policies during creation, just take note of the bucket’s ARN first.

**S3 Create bucket policy**

Find a policy from [AWS](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html)

**S3 Create IAM user**
Allow an IAM user to access a bucket.

Below is a version of [this](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-policies-s3.html#iam-policy-ex0) user policy that only allows programmatic access:

```
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
         ],
         "Resource": [
                "arn:aws:s3:::examplebucket",
                "arn:aws:s3:::examplebucket/*"
            ]
      }
   ]
}
```

# bucket url format

https://s3-ap-southeast-1.amazonaws.com/bucket-name

# CORS

```
<?xml version="1.0" encoding="UTF-8"?>
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
<CORSRule>
    <AllowedOrigin>https://www.example.com</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <MaxAgeSeconds>3000</MaxAgeSeconds>
    <AllowedHeader>*</AllowedHeader>
</CORSRule>
</CORSConfiguration>
```
