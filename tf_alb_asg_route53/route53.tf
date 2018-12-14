resource "aws_route53_record" "cname_route53_record" {
  zone_id = "${var.route53_zone_id}" # Replace with your zone ID
  name    = "${var.dns_subdomain}"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_alb.alb_front.dns_name}"]
}


#If you are using alias


#resource "aws_route53_record" "alias_route53_record" {
#  zone_id = "${aws_route53_zone.primary.zone_id}" # Replace with your zone ID
#  name    = "example.com" # Replace with your name/domain/subdomain
#  type    = "A"

#  alias {
#    name                   = "${aws_lb.MYALB.dns_name}"
#    zone_id                = "${aws_lb.MYALB.zone_id}"
#    evaluate_target_health = true
#  }
#}
