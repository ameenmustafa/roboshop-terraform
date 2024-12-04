
data "aws_security_group" "allow-all" {
  name = "allow-all"
}

# variable "instance_type"{
#     default = "t2.micro"
#     }

# variable "components"{
#     default = ["frontend","mongodb","catalogue"]
#     }

variable "components"{
    default = {
        frontend={
            name = "frontend"
            instance_type = "t2.micro"
            }

         mongodb={
                    name = "mongodb"
                    instance_type = "t3.micro"
                    }
          catalogue={
                     name = "catalogue"
                     instance_type = "t3.micro"
                     }

           redis={
                      name = "redis"
                      instance_type = "t3.micro"
                      }
            user={
                       name = "user"
                       instance_type = "t3.micro"
                       }
             cart={
                        name = "cart"
                        instance_type = "t3.micro"
                        }
              mysql={
                         name = "mysql"
                         instance_type = "t3.micro"
                         }
               shipping={
                          name = "shipping"
                          instance_type = "t3.micro"
                          }
                rabbitmq={
                           name = "rabbitmq"
                           instance_type = "t3.micro"
                           }
                payment={
                                           name = "payment"
                                           instance_type = "t3.micro"
                                           }
                dispatch={
                                                           name = "dispatch"
                                                           instance_type = "t3.micro"
                                                           }
    }
}
resource "aws_instance" "instance" {
    for_each = var.components
#     count = length(var.components)
  ami           = "ami-0453ec754f44f9a4a"
#   instance_type = var.instance_type
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "records" {
    for_each = var.components
  zone_id = "Z08867423NOB20RYSKEDB"
  name    = "${each.value["name"]}.wecandev.xyz"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}
