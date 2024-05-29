provider "aws" {}

variable "keys" {
    description = "Contains the keys associated with person characteristics"
    type = list(string)
    default = ["age", "gender", "height"]
}

variable "values" {
    description = "Contains the values associated with person characteristics keys"
    type = list(string)
    default = ["22", "male", "182"]
}

output "Zipmap" {
    value = zipmap(var.keys, var.values)    # Creates a map given keys and values list
}