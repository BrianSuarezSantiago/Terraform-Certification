variable "ip_address" {
    default = "0.0.0.0/0"    # Default value for this specific variable
    description = "Contains the IP address for the firewall rules"
}

variable "tcp_ip_protocol" {
    default = "TCP"
    description = "Specify the IP protocol for the firewall rules"
}