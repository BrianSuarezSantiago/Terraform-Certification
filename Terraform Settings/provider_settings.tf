terraform {
    required_providers {
        # It is possible to map a local provider (mycloud) with the source of a remote cloud provider
        mycloud = {
            source = "hashicorp/aws"    # Official AWS cloud provider
            version = "5.51.1"
        }
    }
}