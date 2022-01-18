# packer-rstudio-ami
Create FIN510-RStudio AMI using packer:

- Install [packer](https://learn.hashicorp.com/tutorials/packer/getting-started-install)
- Edit rstudio.json as needed
- `AWS_PROFILE=default packer build rstudio.json`
- `aws --profile profile ec2 run-instances --image-id ami-xxxxxxxx --instance-type t2.micro --security-group-ids sg-xxxx --iam-instance-profile Name=iam-instance-profile --key-name MyKeyPair`
- `aws --profile profile ec2 modify-image-attribute --image-id ami-xxx --launch-permission "Add=[{UserId=$AccountID}]"`