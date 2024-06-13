variable "port" {
    description = "Contains the application port"
    type = string
}

variable "protocol" {
    description = "Specify the protocol"
    type = string
}

variable "sources" {
    description = "Specify the incoming allowed connections"
    type = list(string)
}