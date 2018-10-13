# define provider
# Notice: variables will beimported from terraform.tfvars, *.auto.tfvars etc
# reference：
#   - https://www.terraform.io/docs/configuration/providers.html
#   - https://www.terraform.io/docs/providers/index.html

provider "aws" {
  region = "${var.aws_lightsail_region}"
  access_key = "${var.aws_lightsail_access_key}"
  secret_key = "${var.aws_lightsail_secret_key}"
}