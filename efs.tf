resource "aws_efs_file_system" "minecraft_server" {
  creation_token = "minecraft-server-token"
  performance_mode = "generalPurpose"

  tags = {
    Name = "minecraft"
  }
}

resource "aws_efs_mount_target" "efs_mount_target" {
  count                  = 1
  file_system_id         = aws_efs_file_system.minecraft_server.id
  # subnet_id              = element(var.subnet_ids, count.index)
  subnet_id = element(module.vpc.public_subnets, count.index)
  security_groups  = [aws_security_group.minecraft_server.id]
}

# output "minecraft_server_efs_id" {
#   value = aws_efs_file_system.minecraft_server.id
# }