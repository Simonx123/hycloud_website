output "Lb_DNS-Name" {
  value = aws_lb.hy_alb.dns_name
}

output "vpc_id" {
  value = aws_vpc.main.id
}

