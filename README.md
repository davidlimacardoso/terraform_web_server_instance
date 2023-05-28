# terraform_web_server_instance

## Create a instance with Web Server Httpd in AWS EC2

### Variables
- Define a existent VPC
- Define a existent subnet
- Define a AMI

### Provider
- Define a AWS profile
- Define a AWS region

### What does it do?
- Create security groups
- Create instance
- Install httpd dependencies
- Create index.html with hostname

<br>

```
terraform init

```
```
terraform apply --auto-approve
```