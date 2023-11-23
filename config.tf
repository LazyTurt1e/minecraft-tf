provider "aws" {
  region = "eu-central-1"

  # assume_role {
  #   role_arn    = "arn:aws:iam::760178553019:role/landing_zone_devops_administrator"
  # }

  default_tags {
    tags = {
      realm          = "Playground"
      billed-team    = "Technative Managed Services"
      billed-service = "Minecraft"
      resource-group = "Minecraft"
      github-repo    = "TechNative-B-V/wtoorren-mc-server"
      managed-by     = "terraform"
    }
  }
}
