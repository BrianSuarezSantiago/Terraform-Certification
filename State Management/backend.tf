# This approach does not implement file state lock security
terraform {
    backend "s3" {
        bucket = "brian-terraform-backend"
        key = "infrastructure/state_management.tfstate"
        region = "eu-west-2"
        #dynamodb_table = "dynamodb_table_name"    # Uncomment to implement state lock
    }
}