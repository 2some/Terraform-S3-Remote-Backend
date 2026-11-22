Terraform S3 Remote Backend

Project Overview

This project demonstrates how to configure Terraform to store infrastructure state remotely using an Amazon S3 bucket.

The project provisions an AWS VPC using a Terraform module and stores the Terraform state file remotely in Amazon S3.

Technologies Used

* Terraform
* AWS
* Amazon S3
* AWS CLI
* Visual Studio Code
* WSL Ubuntu

AWS Configuration

Setting	Value
AWS Region	eu-north-1
S3 Bucket	obinna-terraform-state-2026
State File	terraform.tfstate
Backend	Amazon S3
State Versioning	Enabled
State Locking	Enabled in Terraform configuration

Project Structure

Terraform-S3-Remote-Backend/
├── environments/
│   ├── dev/
│   └── prod/
├── modules/
│   └── vpc/
├── main.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── README.md

Implementation

1. Created an Amazon S3 bucket for remote Terraform state.
2. Enabled S3 bucket versioning.
3. Configured the S3 backend in the root main.tf file.
4. Enabled Terraform state locking using use_lockfile = true.
5. Initialised Terraform successfully.
6. Executed Terraform plan to validate the infrastructure.
7. Verified that the state file was stored in Amazon S3.
8. Retrieved the remote state using terraform state pull.

Terraform Backend Configuration

terraform {
  backend "s3" {
    bucket         = "obinna-terraform-state-2026"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    use_lockfile   = true
  }
}

Validation Commands

terraform init
terraform plan
terraform plan -lock=true
terraform state list
terraform state pull
aws s3 ls s3://obinna-terraform-state-2026

Validation Results

* Terraform initialisation completed successfully.
* Terraform plan reported no infrastructure changes.
* Existing VPC state was refreshed successfully.
* The S3 bucket contained the remote state file.
* Terraform successfully retrieved the state from the remote backend.

Conclusion

This project demonstrates the implementation of Terraform remote state management using Amazon S3, including state versioning and the configured state-locking mechanism.

The setup provides a foundation for managing infrastructure state centrally and safely across Terraform workflows.
