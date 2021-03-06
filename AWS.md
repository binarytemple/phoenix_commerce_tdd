
# AWS S3 ACL Example

This ACL allows a low privileged user, in this case `binarytemple-phoenix-commerce` to read and write files to the AWS S3 bucket named `binarytemple-phoenix-commerce`. 

The policy itself was generated using the [AWS policygen online tool](http://awspolicygen.s3.amazonaws.com/policygen.html)
 
```
{
  "Id": "Policy1461327713160",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1461327705032",
      "Action": [
        "s3:GetBucketAcl",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:GetObjectVersion",
        "s3:GetObjectVersionAcl",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:ListBucketVersions",
        "s3:PutObject",
        "s3:PutObjectAcl"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::binarytemple-phoenix-commerce",
        "arn:aws:s3:::binarytemple-phoenix-commerce/*"
      ],
      "Principal": {
        "AWS": [
          "arn:aws:iam::175765365000:user/binarytemple-phoenix-commerce"
        ]
      }
    }
  ]
}
```

ALSO! 

I also needed to create the following policy and attach it to the use so that 'binarytemple-phoenix-commerce' would have the ability to list the buckets, otherwise you would be unable to view and list the files using a tool such as Transmit which needs the ability to list all buckets associated with a particular account. You need to specify this privileged in a seperate policy file, here is how I did it:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Resource": [
                "arn:aws:s3:::*"
            ]
        }
    ]
}
```

