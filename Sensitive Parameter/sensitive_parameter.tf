locals {
    db_password = {
        admin = "password"
    }
}

output "db-password" {
    value = local.db_password    # local.local_variable_name
    # To correctly test this functionallity, apply the configuration by using and removing the "sensitive" argument
    sensitive = true
}