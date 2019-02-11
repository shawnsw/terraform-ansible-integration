# Terraform and Ansible Integration

Examples of how to integrate Terraform infrastructure provisioning and Ansible configuration management for end-to-end automation.

## Terraform triggering Ansible

### Provision instance with Terraform

* Get latest Amazon Linux 2 AMI
* Create AWS key pair
* Create AWS security group
* Create EC2 instance with local-exec provisioner triggering Ansible

### Configuration instance with Ansible

* Install webserver
* Upload index.html
* Restart webserver

## Ansible triggering Terraform

### Create and upload

* Trigger Terraform to create a S3 bucket
* Upload file to bucket

### Backup and destroy

* Backup file from S3 bucket
* Remote S3 object
* Trigger Terraform to destroy the bucket