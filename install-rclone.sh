#/!bin/bash

set -e
sudo apt-get update
sudo apt-get dist-upgrade -y
wget https://downloads.rclone.org/v1.54.1/rclone-v1.54.1-linux-amd64.deb
sudo gdebi -n rclone-v1.54.1-linux-amd64.deb
rm -f rclone-v1.54.1-linux-amd64.deb
sudo apt clean
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip install-rclone.sh
