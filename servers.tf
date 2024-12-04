
data "aws_security_group" "allow-all" {
  name = "allow-all"
}

variable "instance_type"{
    default = "t2.micro"
    }

variable "components"{
    default = ["frontend","mongodb","catalogue"]
    }
resource "aws_instance" "frontend" {
    count = lenght(var.components)
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "var.components[count.index]"
  }
}

# resource "aws_route53_record" "frontend" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "frontend.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.frontend.private_ip]
# }
#
# resource "aws_instance" "mongodb" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "mongodb"
#   }
# }
#
# resource "aws_route53_record" "mongodb" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "mongodb.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.mongodb.private_ip]
# }
#
# resource "aws_instance" "catalogue" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "catalogue"
#   }
# }
#
# resource "aws_route53_record" "catalogue" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "catalogue.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.catalogue.private_ip]
# }
#
# resource "aws_instance" "redis" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "redis"
#   }
# }
#
# resource "aws_route53_record" "redis" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "redis.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.redis.private_ip]
# }
#
# resource "aws_instance" "user" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "user"
#   }
# }
#
# resource "aws_route53_record" "user" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "user.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.user.private_ip]
# }
#
# resource "aws_instance" "cart" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "cart"
#   }
# }
#
# resource "aws_route53_record" "cart" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "cart.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.cart.private_ip]
# }
#
# resource "aws_instance" "mysql" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "mysql"
#   }
# }
#
# resource "aws_route53_record" "mysql" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "mysql.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.mysql.private_ip]
# }
#
# resource "aws_instance" "shipping" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "shipping"
#   }
# }
#
# resource "aws_route53_record" "shipping" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "shipping.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.shipping.private_ip]
# }
#
#
# resource "aws_instance" "rabbitmq" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "rabbitmq"
#   }
# }
#
# resource "aws_route53_record" "rabbitmq" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "rabbitmq.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.rabbitmq.private_ip]
# }
#
# resource "aws_instance" "payment" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "payment"
#   }
# }
#
# resource "aws_route53_record" "payment" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "payment.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.payment.private_ip]
# }
#
# resource "aws_instance" "dispatch" {
#   ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
#   vpc_security_group_ids = [data.aws_security_group.allow-all.id]
#   tags = {
#     Name = "dispatch"
#   }
# }
#
# resource "aws_route53_record" "dispatch" {
#   zone_id = "Z08867423NOB20RYSKEDB"
#   name    = "dispatch.wecandev.xyz"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.dispatch.private_ip]
# }