# aws_vpc_test_env

## Project Description
This repo contains a set of code that allows you to build a test environment on **AWS** using **terraform.** The test environment consists of a **VPC, public subnet, internet gateway, route table, security group, keypair, and amazon EC2 instance.**

With everything properly configured, you will be introduced to some key concepts of terraform. Terraform is an infrastructure as code tool that enables you to define your infrastructure using code. This allows you to manage your infrastructure in a controlled and consistent manner.

In addition to the basics of setting up a test environment, this repo will also show you how to launch an EC2 instance. This instance can be used to test your code and applications.

### Why Use Terraform
There are many reasons for using Terraform as Infrastructure as a code. 
- Terraform allows you to define your infrastructure in a declarative way, meaning you describe what you want and Terraform will figure out how to create it. This can be very useful when dealing with complex infrastructure. 

- Additionally, Terraform is highly extensible, so if you need to add new functionality or customize existing functionality, you can do so easily. 

- Finally, Terraform is an open source project with a strong community

## Prerequisite

There are a few things you need before you can use this repo:

1) An AWS account with admin priviledges. You can learn how to create an AWS account [HERE] (https://docs.aws.amazon.com/polly/latest/dg/setting-up.html).

2) AWS CLI set up on a local machine. You can learn how to set up AWS CLI [HERE] (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

3) A good understanding of cloud fundamentals and some experience creating services in a public cloud, AWS in this case.

4) Terraform installed on a local machine. You can learn how to install Terraform [HERE] (https://learn.hashicorp.com/tutorials/terraform/install-cli).
