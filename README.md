project/
├── ec2-module/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── root-module/
│   ├── main.tf
│   ├── variables.tf
│   └── terraform.tfvars

# Commands
	terraform init        # Initialize Terraform and download modules
	terraform plan        # Preview changes
	terraform apply       # Apply and launch EC2 instance

✅ Essential Setup Checklist

1. Install Terraform -
	terraform -version

2. Configure AWS CLI Credentials - 
	aws configure
### NOTE: Ensure it creates the file ~/.aws/credentials with proper AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
#  Alternatively, export environment variables:
	export AWS_ACCESS_KEY_ID=your_access_key
	export AWS_SECRET_ACCESS_KEY=your_secret_key
	export AWS_DEFAULT_REGION=us-east-1

3. Create Required AWS Resources Manually or via Terraform
   Before running this module, you need:

- ✅ VPC with at least one public subnet
- ✅ Security Group that allows inbound SSH (port 22)
- ✅ Key Pair (for SSH access)

🔐 Best Practices (Optional Enhancements) :

| Practice                                                        | Why It Helps                              |
| --------------------------------------------------------------- | ----------------------------------------- |
| Use `terraform.tfstate` in S3 with locking via DynamoDB         | For shared infrastructure & safety        |
| Use `.tfvars` files for different environments (dev/stage/prod) | Environment isolation                     |
| Add `user_data` to bootstrap EC2 instances                      | Automated software installation           |
| Create outputs like `public_dns`, `instance_profile`, etc.      | Useful for integration with other modules |
| Use `locals` and `default` values in `variables.tf`             | Makes modules more portable               |
