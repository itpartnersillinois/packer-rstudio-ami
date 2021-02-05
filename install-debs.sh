#/!bin/bash

set -e

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y r-base r-base-dev gdebi-core libcurl4-openssl-dev libxml2-dev libssl-dev
#sudo apt-get install -y r-cran-boot r-cran-gbm r-cran-ggplot2 r-cran-glmnet r-cran-knitr r-cran-maps \
#    r-cran-mapproj r-cran-mass r-cran-plm r-cran-randomforest r-cran-rpart r-cran-tidyr r-cran-tidyverse
chmod a+x /home/ubuntu/install-rpackages.sh
sudo /home/ubuntu/install-rpackages.sh
sudo useradd -m -p sayzF.CuJmED6 rstudio
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1103-amd64.deb
sudo gdebi -n rstudio-server-1.4.1103-amd64.deb
rm -f rstudio-server-1.4.1103-amd64.deb
echo "www-port=80" > /tmp/rserver-port-80.conf
sudo cp /tmp/rserver-port-80.conf /etc/rstudio/rserver.conf 
sudo apt clean
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip install-rpackages.sh
