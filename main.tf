terraform {
  required_providers {
    minecraft = {
      source  = "HashiCraft/minecraft"
      version = "0.1.0"
    }
  }
}

// Configure the provider with the RCON details of the Minecraft server
provider "minecraft" {
  address  = "localhost:27015"
  password = "password"
}