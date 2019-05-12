# using-cloudformation

Some sauces have a `sauce.yml` CloudFormation template, optionally with 
a `/cf` folder with some sub-templates. If you choose to use them to
quickly deploy and try a sauce, follow this guide.

## create an S3 bucket for sub-templates

_for sauces with sub-templates only_

CloudFormation demands that sub-templates reside in S3 buckets, so
if there are sub-templates in `/cf` folder, you need to create a
bucket first.

Make sure that you have installed the Git CLI, if not, read:

- [using-git]

You can clone the `/cf` folder using CLI command:

```
git clone https://awsauce-bucket-uri
```

Make sure that you have installed the AWS CLI, if not, read:

- [using-aws-cli]

You may create the bucket with the following CLI command:

```
aws s3 mb s3://sauce-name
```

`mb` means "make bucket". Default bucket is sufficient to hold the 
templates.

You may then copy all the sub-templates to the bucket:

```
aws s3 cp --recursive . s3://sauce-name
```

Take a note of the bucket URL.

You may also choose to do it the old way (using AWS console).

## create the stack

You may now start creating the stack.

```
cd /sauce-root-folder
aws cloudformation create-stack --template-body file://sauce.yml
```