# resource "minecraft_block" "stone" {
#   material = "minecraft:stone"

#   position = {
#     x = -47,
#     y = 65,
#     z = 29
#   }
# }

# resource "minecraft_block" "stone" {
#   material = "minecraft:stone"

#   position = {
#     x = -47,
#     y = 65,
#     z = 29
#   }
# }

# module "name" {
#   source = "./cube"

#   material = "cobblestone"

#   position = {
#     x = 10,
#     y = 75,
#     z = -100
#   }

#   dimensions = {
#     width  = 1,
#     length = 6,
#     height = 5
#   }
# }

# module "pig" { 
#  source = "./entity"

#  entity = "pig"
  
#  amount=3

#    x = 224,
#    y = 81,
#    z = 2024
#   }

# }








module "floor_for_test" {
  source = "./cube"

  material = "smooth_stone"

  position = {
    x = 220,
    y = 69,
    z = 2020
  }

  dimensions = {
    width  = 10,
    length = 10,
    height = 1
  }
}

module "hollow-cube" {
  source = "git::https://github.com/DevOpsPlayground/terraform_minecraft_playground.git//square"
  material = "minecraft:stone"

  position = {
    x = 222,
    y = 70,
    z = 2022
  }

  dimensions = {
    width  = 6,
    length = 6,
    height = 4
  }
}

module "top_for_test" {
  source = "./cube"

  material = "smooth_stone"

  position = {
    x = 220,
    y = 74,
    z = 2020
  }

  dimensions = {
    width  = 10,
    length = 10,
    height = 1
  }
}

module "middel" {
  source = "./cube"

  material = "water"

  position = {
    x = 224,
    y = 71,
    z = 2024
  }

  dimensions = {
    width  = 2,
    length = 2,
    height = 1
  }
}

module "water_holder" {
  source = "git::https://github.com/DevOpsPlayground/terraform_minecraft_playground.git//square"

  material = "chiseled_stone_bricks"

  position = {
    x = 223,
    y = 70,
    z = 2023
  }

  dimensions = {
    width  = 4,
    length = 4,
    height = 2
  }
}

module "torch_inside" {
  source = "git::https://github.com/DevOpsPlayground/terraform_minecraft_playground.git//square"

  material = "torch"

  position = {
    x = 223,
    y = 72,
    z = 2023
  }

  dimensions = {
    width  = 4,
    length = 4,
    height = 1
  }
}
