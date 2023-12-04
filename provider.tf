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
  address  = "3.79.241.137:25575"
  password = "Worlt"
}