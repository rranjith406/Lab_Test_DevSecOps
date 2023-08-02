provider "aws" {
  region = "us-east-1"  # Change this to your desired region
}

# VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"  # You can change the CIDR block as needed
}

# Subnet within VPC
resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.1.0/24"  # You can change the CIDR block as needed
  availability_zone = "us-east-1a"   # Change this to an available AZ in your region
}

# EC2 instances
resource "aws_instance" "example_instance_1" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Change this to your desired instance type
  subnet_id     = aws_subnet.example_subnet.id

  tags = {
    Name = "Example_Instance_1"
  }
}

resource "aws_instance" "example_instance_2" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"  # Replace with your desired AMI ID
  instance_type = "t2.micro"  # Change this to your desired instance type
  subnet_id     = aws_subnet.example_subnet.id

  tags = {
    Name = "Example_Instance_2"
  }
}

# EBS volumes
resource "aws_ebs_volume" "example_ebs_volume_1" {
  availability_zone = "us-east-1a"  # Change this to match the availability zone of the instance
  size              = 8  # Change the size of the EBS volume as needed
}

resource "aws_ebs_volume" "example_ebs_volume_2" {
  availability_zone = "us-east-1a"  # Change this to match the availability zone of the instance
  size              = 8  # Change the size of the EBS volume as needed
}

# Attach EBS volumes to EC2 instances
resource "aws_volume_attachment" "example_volume_attachment_1" {
  device_name = "/dev/sdf"  # Change this to the desired device name for attachment
  volume_id   = aws_ebs_volume.example_ebs_volume_1.id
  instance_id = aws_instance.example_instance_1.id
}

resource "aws_volume_attachment" "example_volume_attachment_2" {
  device_name = "/dev/sdf"  # Change this to the desired device name for attachment
  volume_id   = aws_ebs_volume.example_ebs_volume_2.id
  instance_id = aws_instance.example_instance_2.id
}

# S3 Bucket outside VPC
resource "aws_s3_bucket" "example_s3_bucket" {
  bucket = "example-s3-bucket"  # Change this to your desired bucket name
  acl    = "private"  # You can change the access control settings as needed
}
