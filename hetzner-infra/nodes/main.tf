terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = ">= 1.45"
    }
  }
}

data "hcloud_network" "lan" {
  name = var.network_name
}

data "hcloud_firewall" "firewall" {
  name = var.firewall_name
}

resource "hcloud_server" "example_server" {
  count      = var.server_count
  name       = "node-${count.index + 2}"
  image      = var.server_image
  server_type = var.server_type
  firewall_ids = [ data.hcloud_firewall.firewall.id ]
  location = "nbg1"
  labels = {
    "created_by" : "terraform"
  }

  network {
    network_id = data.hcloud_network.lan.id
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
