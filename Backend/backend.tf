terraform {
    backend "s3" {
        bucket = "brian-terraform-backend"
        key = "infrastructure/terraform.tfstate"    # Path where the .tfstate file will be store
        region = "eu-west-2"    # It is mandatory to specify even if it is present on the AWS "config" file
        # It is also necessary to provide the access/secret keys to perform the PUT operation to store in the
        # bucket and also the GET operation to fecth from the bucket. We can hardcoded the values here within
        # the appropiate arguments or by placing it on the "credentials" file when AWS CLI was configured ($ aws configure)
    }
}