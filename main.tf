terraform {
  required_providers {
    minecraft = {
      source  = "HashiCraft/minecraft"
      version = "0.1.1"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "sirplexus" {
  name = "sirplexus/minecraft-server-standalone:latest"
}

// Configure the provider with the RCON details of the Minecraft server
provider "minecraft" {
  address  = "localhost:25565"
  password = "5879"
}

module "cube" {
  source = "./cube"

  material = "cobblestone"

  position = {
    x = 29,
    y = 70,
    z = 21
  }

  dimensions = {
    width  = 2,
    length = 2,
    height = 2
  }
}