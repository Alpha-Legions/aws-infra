# Terraform Configuration for AWS VPC

This Terraform configuration file creates a Virtual Private Cloud (VPC) in AWS, along with several networking resources.

## Prerequisites
Before running this Terraform configuration, you will need to:

- Install Terraform on your local machine
- Set up your AWS credentials on your local machine

## Configuration
The Terraform configuration file in this repository creates the following resources:

- 3 public subnets and 3 private subnets, each in a different availability zone in the same region in the same VPC
- An Internet Gateway resource attached to the VPC
- A public route table with all public subnets attached to it
- A private route table with all private subnets attached to it
- A public route in the public route table with the destination CIDR block 0.0.0.0/0 and the internet gateway created above as the target.
- You can customize the configuration by modifying the variables defined at the beginning of the main.tf file.

## Usage
To use this Terraform configuration:

1. Clone this repository to your local machine.
2. Navigate to the root directory of the repository.
3. Run terraform init to initialize Terraform.
4. Run terraform plan to preview the resources that will be created.
5. If the plan looks correct, run terraform apply to create the resources.

## Cleanup
To remove the resources created by this Terraform configuration:

1. Run terraform destroy.
2. Review the resources that will be destroyed, and enter "yes" when prompted.
3. Wait for Terraform to destroy the resources.

## Troubleshooting
If you encounter any issues when running this Terraform configuration, try:

- Reviewing the Terraform documentation: https://www.terraform.io/docs/index.html
- Reviewing the AWS documentation: https://aws.amazon.com/documentation/
- Checking the Terraform logs for error messages.


