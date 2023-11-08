terraform {
  required_providers {
    minecraft = {
      source  = "HashiCraft/minecraft"
      version = "0.1.1"
    }
  }
}

// Configure the provider with the RCON details of the Minecraft server
provider "minecraft" {
  address  = "localhost:25575"
  password = "5879"
}

# resource "minecraft_block" "stone" {
#   material = "minecraft:stone"

#   position = {
#     x = -47,
#     y = 65,
#     z = 29
#   }
# }

module "cube1" {
  source = "./cube"

  material = "cobblestone"

  position = {
    x = 10,
    y = 75,
    z = -100
  }

  dimensions = {
    width  = 5,
    length = 5,
    height = 5
  }
}

module "cube2" {
  source = "./cube"

  material = "cobblestone"

  position = {
    x = 10,
    y = 80,
    z = -100
  }

  dimensions = {
    width  = 5,
    length = 5,
    height = 5
  }
}
