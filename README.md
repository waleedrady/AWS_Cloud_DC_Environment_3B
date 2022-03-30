# DataCenter Enviroment 3B

Source Code for this Module (https://github.com/WEEMR/terraform-aws-DataCenter_Enviroment_3B)

Terraform Registery         (https://registry.terraform.io/modules/WEEMR/DataCenter_Enviroment_3B/aws/latest)

![image](https://user-images.githubusercontent.com/82145296/160909922-7ec8798b-7c03-49e0-95ac-37e4df390e2e.png)

The module will create the below resources:

- 5 x VPCs, a single Hub and 4 Spoke
- Networking Stack (VPC, Subnets, Route Tables, Security Groups, Internet Gateway and Nat Gateway) - Please refer to the diagram below.
- 5 x FortiGate with 3 interfaces (Two Interfaces in two different Public Subnets and one in the Private subnets)
- 5 x Windows Server 2019 Behind each FGT Port 3 [LAN]
- 5 x Ubunutu Server with Apache installed, iperf, fzf, pydf, firefox, lynx and elinks installed on it behind each FGT port 3 [LAN]
- Route53 DNS Public Hosted Zones
- FortiManager will be deployed as well behind the Hub FGT on Port 3 [LAN]
- VPC Flow Logs


// The DNS Hosted Zones must be sub-zones for a domain that is registered or managed by AWS Route53 //

// i.e xyz.com is the domain name and you will create the subzone Lab1.xyz.com // 
