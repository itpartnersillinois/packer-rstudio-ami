# packer-rstudio-ami
Create FIN510-RStudio AMI using packer:

- Install [packer](https://learn.hashicorp.com/tutorials/packer/getting-started-install)
- Edit rstudio.json as needed
- `AWS_PROFILE=default packer build rstudio.json`
