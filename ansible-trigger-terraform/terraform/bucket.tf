resource "aws_s3_bucket" "ansible-terraform" {
  bucket = "ansible-terraform"
  acl    = "private"

  tags = {
    Name        = "ansible-terraform"
  }
}