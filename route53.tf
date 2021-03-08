resource "aws_route53_zone" "hycloud_zone" {
  name = "neoageml.com"

  tags = {
    Name = "Hycloud_Zone"
  }
}


resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.hycloud_zone.zone_id
  name    = "neoageml.com"
  type    = "A"

  alias {
    name                   = aws_lb.hy_alb.dns_name
    zone_id                = aws_lb.hy_alb.zone_id
    evaluate_target_health = true
  }
}