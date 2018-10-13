# aws lightsail variables
# Notice: all files end with .tf will imported during terraform environment, including terraform.tfvars.
# Reference:
#   - https://www.terraform.io/intro/getting-started/variables.html

variable "project_name" {
  default = "SRA_app"
}

# AWS platform access key
variable "aws_lightsail_access_key" {
  default = "access_key"
}

variable "aws_lightsail_secret_key" {
  default = "secret_key"
}

# Instance running region
# use aws cli： `aws lightsail get-regions`to see a list.
variable "aws_lightsail_region" {
  default = "ap-northeast-2"
}

# Define key pair name for login aws lightsail instance
variable "aws_lightsail_instance_key_pair_name" {
  default = "default_key_pair"
}

# Path of your priviate key for aws lightsail instance access
variable "aws_lightsail_instance_private_key" {
  default = "location_of_your_key"
}

# aws lightsail instance zone
# options：us-east-1, us-east-2, us-west-2, eu-west-1, eu-west-2, eu-west-3,
#          eu-central-1, ap-south-1, ap-southeast-1, ap-southeast-2, 
#          ap-northeast-1, ap-northeast-2a, ap-northeast-2ac, ca-central-1, 
# Use aws cli： `aws lightsail get-regions`to check the list of zones。
variable "availability_zone" {
  default = "ap-northeast-2a"
}
  
# aws lightsail blueprint id
# options： amazon_linux_2018_03_0_1,ubuntu_16_04_2,debian_8_7,freebsd_11_1,
#           opensuse_42_2, centos_7_1805_01 
# Use aws cli： `aws lightsail get-blueprints` to see more.
variable "blueprint_id" {
  default = "amazon_linux_2018_03_0_1"
}

# aws lightsail instance server hardware bundle ID
# options： nano_2_0, micro_2_0, small_2_0, medium_2_0, large_2_0, xlarge_2_0,
#           2xlarge_2_0
# Use aws cli：`aws lightsail get-bundles` to see more.
variable "bundle_id" {
  default = "micro_2_0"
}
