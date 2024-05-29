# Specific type block
terraform {
    # Terraform minimum required version
    required_version = "~>1.8"    # Version under 1.8.X

    # Cloud provider (AWS) minimum required version
    required_providers {    
        aws = ">=5.40.0"    # Version greater or equal than 5.40.0
    }
}