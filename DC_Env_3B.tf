module "DataCenter_Enviroment_3B" {
  source  = "WEEMR/DataCenter_Enviroment_3B/aws"
  version = "1.6.0"
  # insert the 7 required variables

  # ------------------------------------------------------ AWS Account Settings ------------------------------------------ #

  access_key = "YOUR ACCESS KEY"
  secret_key = "YOUR SECRET KEY"

  # ------------------------------------------------------ Variables ----------------------------------------------------- #

  username = "jdoe"  #  Your 1st Initial, Last Name to tag resources i.e jdoe
  keyname  = "YOUR AWS KEY NAME"   #  Your AWS Keypair name to create resources
  Password = "Fortinet123!"        #  TO DO: Change the password from "fortinet123" to your own password

  # ------------------------------------------------------  DNS ------------------------------------------------------------ #

  Public_Hosted_Zone = "fortinetpslab.com"            # You must have a domain registerd with AWS Route53 or Managed by AWS with a Hosted Zone Created. i.e xyz.com
  SubHosted_Zone     = "jdoe.fortinetpslab.com" # Creates a Public SubHosted zone  - Enter a sub-hosted name for the domain above. i.e lab.xyz.com

  # ------------------------------------------------------ Reference Module ------------------------------------------------ #

  #                         Terraform Registery Module = https://github.com/waleedrady/AWS_Cloud_DC_Environment_3B

  #                             Source Code = https://github.com/WEEMR/terraform-aws-DataCenter_Enviroment_3B

}
  


#  ----------------  Outputs  -----------------  # 
  
output "__LAB_URLs__" {
  value = module.DC_Enviroment_3B.LAB_URLs
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

