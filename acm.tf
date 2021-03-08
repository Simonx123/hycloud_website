resource "aws_acm_certificate" "cert" {
  domain_name       = "neoageml.com"
  subject_alternative_names  = ["www.neoageml.com"]
  validation_method = "DNS"

  tags = {
    Name = "hycloud_acm"
  }

  lifecycle {
    create_before_destroy = true
  }
}