resource "aws_route53_record" "example_record" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"
  ttl     = 60
  records = [aws_instance.ec2_instance.public_ip]
}