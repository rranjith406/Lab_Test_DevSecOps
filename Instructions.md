Make sure you have Terraform installed on your machine and have your AWS credentials set up properly.

Please note the following:

Replace ami-xxxxxxxxxxxxxxxxx with the actual AMI ID of the desired EC2 instance image.
Change the region (us-east-1) in the provider block to your desired AWS region.
Ensure that the availability zone specified for the EC2 instances and EBS volumes (us-east-1a) is available in your selected region.
Customize the VPC CIDR block, subnet CIDR block, instance type, and EBS volume size according to your requirements.
Replace example-s3-bucket with your desired S3 bucket name.

Once you save the above code in a .tf file, run the following commands:

terraform init
terraform apply


Terraform will prompt you to confirm the changes to be made to your AWS account. Type **yes** to proceed, and it will create the specified resources in your AWS account according to the defined architecture.
