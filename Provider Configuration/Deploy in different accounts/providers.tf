provider "aws" {
    alias = "ireland"
    region = "eu-west-1"
    profile = "default"
}

provider "aws" {
    alias = "frankfurt"
    region = "eu-central-1"
    profile = "account02"
    # It is possible to hardcoded the access/secret key values here instead of include it as part of the credentials file
    #access_key = ""
    #secret_key = ""
}