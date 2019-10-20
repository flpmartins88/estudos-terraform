# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "${var.amis["us-east-1"]}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev_${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev-4" {
  provider = "aws.us-east-2"
  ami = "${var.amis["us-east-2"]}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  tags = {
      Name = "dev_4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = ["aws_s3_bucket.bucket1"]
}

resource "aws_s3_bucket" "bucket1" {
  provider = "aws.us-east-2"
  bucket = "bucket-name"
  acl = "private"

  tags = {
    Name = "bucket-name"
  }
}
