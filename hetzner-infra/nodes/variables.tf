variable "server_count" {
    type        = number
    description = "Number of servers to create"
}

variable "server_image" {
    type = string
    description = "ID or name of the server image"
}

variable "server_type" {
    type = string
    description = "Type of the server"
}

variable "network_name" {
    type = string
    description = "Name of the local network where servers reside"
}

variable "firewall_name" {
    type = string
    description = "Name of the firewall which all servers use"
}

