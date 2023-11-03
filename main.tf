terraform {
  required_providers {
    minecraft = {
      source  = "HashiCraft/minecraft"
      version = "0.1.1"
    }
    # docker = {
    #   source = "kreuzwerker/docker"
    #   version = "3.0.2"
    # }
  }
}

# provider "docker" {
#   host = "unix:///var/run/docker.sock"
# }

// Configure the provider with the RCON details of the Minecraft server
provider "minecraft" {
  address  = "localhost:25575"
  password = "5879"
}

resource "minecraft_block" "stone" {
  material = "minecraft:stone"

  position = {
    x = -47,
    y = 65,
    z = 29
  }
}

# module "cube" {
#   source = "./cube"

#   material = "cobblestone"

#   position = {
#     x = 10,
#     y = 75,
#     z = -100
#   }

#   dimensions = {
#     width  = 2,
#     length = 2,
#     height = 2
#   }
# }
