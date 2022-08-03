# packer-rstudio-ami
# ami-00d3a5d3fd461c559
Create FIN550-RStudio AMI using packer:

- Install [packer](https://learn.hashicorp.com/tutorials/packer/getting-started-install)
- Edit rstudio.json as needed
- `AWS_PROFILE=uiuc-msba-instructor packer build rstudio-msba.json`
- `aws --profile profile ec2 run-instances --image-id ami-xxxxxxxx --instance-type t2.micro --security-group-ids sg-xxxx --iam-instance-profile Name=iam-instance-profile --key-name MyKeyPair`
- `aws --profile profile ec2 modify-image-attribute --image-id ami-xxx --launch-permission "Add=[{UserId=$AccountID}]"`