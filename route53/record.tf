resource "aws_route53_record" "nlb" {
  name           = "ajaynlb.${resource.aws_route53_zone.selected.name}"
  type           = "A"
  zone_id        = resource.aws_route53_zone.selected.zone_id
  alias {
    name                   = var.dns_name
    zone_id                = var.zone_id
    evaluate_target_health = "false"
  }
}