variable "region" {
  type        = string
  description = "The AWS Region to use"
  default     = "eu-central-1"
}

variable "hosted_domain"{
  type = string
  description = "domain where minecraft alias needs to be configure"
}

variable "minecraft_server_alias"{
  type = string
  description = "alias for cname"
}