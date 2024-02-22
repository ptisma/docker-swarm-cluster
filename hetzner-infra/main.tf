terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
  required_version = ">= 0.13"
}

provider "hcloud" {
  token = var.api_token
}

module "example_servers" {
  source        = "./nodes"
  server_count  = 1
  server_image  = "ubuntu-22.04"
  server_type   = "cx11"
  network_name  = "home-lab-network"
  firewall_name = "firewall-1"
}