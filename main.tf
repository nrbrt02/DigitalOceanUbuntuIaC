terraform {
  required_version = "~> 1.9.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_ssh_key" "terramino" {
  name     = "Terramino SSH Key"
  public_key=  file("${path.module}/files/terramin.pub")
}

resource "digitalocean_droplet" "terramino" {
  image     = "ubuntu-24-04-x64"
  name      = "testing"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  monitoring = true
  ssh_keys =  [
    digitalocean_ssh_key.terramino.id
  ]
}
