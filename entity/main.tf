# locals {
#   x_values = range(var.location.x, var.location.x)
#   y_values = range(var.location.y, var.location.y + 1)
#   z_values = range(var.location.z, var.location.z)

# coordinates = setproduct(local.x_values, local.y_values, local.z_values)
# blocks   = [for coordinate in local.coordinates : zipmap(["x", "y", "z"], coordinate)]

# entity = length(regexall("^[a-z]+:[a-z]+$", var.entity)) > 0 ? var.entity : format("%s:%s", "minecraft", var.entity)
# }

# resource "minecraft_entity" "entity" {

#   amount = var.amount   

#   entity = local.entity

#   location = {
#     x = var.location.x
#     y = var.location.y
#     z = var.location.z
#   }
  
# }



