# To test this feature first create a simple manual resource through the AWS Console and then run the following commands:
# terrafom plan -generate-config-out=file_name.tf
# terraform apply
# The first command generates the configuration file and the second one generates the .tfstate file
import {
    to = aws_security_group.sg    # The "to" argument is just to specify the name of the appropiate resource block to be created
    id = "sg-04fa69d74669d8312"
}