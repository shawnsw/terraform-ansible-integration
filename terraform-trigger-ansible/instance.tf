# create key pair
resource "aws_key_pair" "terraform-ansible" {
  key_name   = "terraform-ansible-key"
  public_key = "${var.ssh_public_key}"
}

# create security group
resource "aws_security_group" "terraform-ansible" {
  name        = "terraform-ansible-sg"
  description = "Allow SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# create an instance
resource "aws_instance" "terraform-ansible" {
  ami           = "${data.aws_ami.amazon_linux_stable_latest.image_id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.terraform-ansible.key_name}"
  security_groups = ["${aws_security_group.terraform-ansible.name}"]

  tags {
    Name = "terraform-ansible"
  }

  provisioner "local-exec" {
      # method 1: construct inventory from terraform state
      command = "sleep 60; ansible-playbook -i '${aws_instance.terraform-ansible.public_dns},' install-webserver.yml"

      # method 2: use terraform-inventory dynamic inventory script https://github.com/adammck/terraform-inventory
      # command = "sleep 90; ansible-playbook -i /usr/local/bin/terraform-inventory install-webserver.yml"
   }
}