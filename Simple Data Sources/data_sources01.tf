# Even without using a specific cloud provider, it is necessary
# to run "terraform init" to download for example local plugins.
data "local_file" "my_local_file" {
    filename = "${path.module}/demo.txt"
}

output "Actual-value" {
    # value = data.resource_type.local_resource_name.attribute_name
    value = data.local_file.my_local_file.content
}