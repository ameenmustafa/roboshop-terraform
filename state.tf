terraform {
  backend "s3" {
    bucket = "tf-bucket-wecandev"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
