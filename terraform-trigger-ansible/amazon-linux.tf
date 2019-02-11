data "aws_ami" "amazon_linux_stable_latest" {
  most_recent = true

  # Name pattern: amzn2-ami-hvm-2.0.20190115-x86_64-gp2
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  # https://www.opswat.com/blog/aws-2015-why-you-need-switch-pv-hvm
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  # Use Amazon Linux 2 upstream
  owners = ["137112412989"]
}