variable "username" {default = "jdoe" }              # Enter your first initial and last name as your username
variable "password" {default = "Fortinet123!"}        # Change the password from "fortinet123" to your own password
#----- 
variable "keyname" {default = "key_name"}   #  Your AWS Keypair name to create resources
#----
variable "access_key" {default = "YOUR_ACCESS_KEY"} 
variable "secret_key" {default = "YOUR_SECRET_KEY"}
#----
variable "Public_Hosted_Zone" {default = "xyz.com"}   # You must have a domain registerd with AWS Route53 or Managed by AWS with a Hosted Zone Created. i.e xyz.com
variable "SubHosted_Zone" {default = "jdoe.xyz.com"} # Creates a Public SubHosted zone  - Enter a sub-hosted name for the domain above. i.e lab.xyz.com



module "DC_Enviroment_3B" {

  source  = "WEEMR/DataCenter_Enviroment_3B/aws"
  version = "1.6.0"

  # insert the 7 required variables here

 
  # ------------------------------------------------------ AWS Account Settings ------------------------------------------ #

  access_key = var.access_key
  secret_key = var.secret_key

  # ------------------------------------------------------ Variables ----------------------------------------------------- #


  username = var.username 
  keyname  = var.keyname 
  Password = var.password        

  # ------------------------------------------------------  DNS ------------------------------------------------------------ #

  Public_Hosted_Zone = var.Public_Hosted_Zone 
  SubHosted_Zone     = var.SubHosted_Zone 

  # ------------------------------------------------------ Reference Module ------------------------------------------------ #

  #                         Terraform Registery Module = https://github.com/waleedrady/AWS_Cloud_DC_Environment_3B

  #                             Source Code = https://github.com/WEEMR/terraform-aws-DataCenter_Enviroment_3B

}

output "__LAB_URLs__" {
  value = "http://lab.${var.username}.${var.Public_Hosted_Zone}/lab.html"
}

output "hub_1_Windows_Password" {
  value = rsadecrypt(module.DC_Enviroment_3B.hub_1_Windows_Password, file("./Key.pem"))
}

output "spoke_1_Windows_Password" {
  value = rsadecrypt(module.DC_Enviroment_3B.spoke_1_Windows_Password, file("./Key.pem"))
}

output "spoke_2_Windows_Password" {
  value = rsadecrypt(module.DC_Enviroment_3B.spoke_2_Windows_Password, file("./Key.pem"))
}

output "spoke_3_Windows_Password" {
  value = rsadecrypt(module.DC_Enviroment_3B.spoke_3_Windows_Password, file("./Key.pem"))
}

output "spoke_4_Windows_Password" {
  value = rsadecrypt(module.DC_Enviroment_3B.spoke_4_Windows_Password, file("./Key.pem"))
}

