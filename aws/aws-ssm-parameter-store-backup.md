# AWS SSM Parameter Store Backup

Download them into a temporary json file.
```
aws ssm get-parameters-by-path --path "/" --recursive --with-decryption > helloworld.json
```

Encrypt the json file and store the password in AWS SSM Secrets Manager.
```
zip -er helloworld.zip helloworld.json
rm -rf helloworld.json
```

Create a new bucket with no public access and versioning on.
Upload the backup.
```
aws s3 cp helloworld.zip s3://project-ssm-parameter-store-backup
```

---

References

https://github.com/A1M918/aws-ssm-migrate/tree/master
