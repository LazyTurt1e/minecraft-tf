

# data "aws_route53_zone" "hoste_domain_zone" {
#   name = var.hosted_domain
# }


# resource "aws_route53_record" "minecraft_server" {
#   zone_id = data.aws_route53_zone.hoste_domain_zone.zone_id
#   name    = "minecraft"
#   type    = "CNAME"
#   ttl     = 300
#   records = [aws_lb.minecraft_server.dns_name]
# }