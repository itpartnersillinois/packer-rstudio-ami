#/!bin/bash

set -e

sudo apt-get purge docker.io -y
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get install -y software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
sudo apt-get update
sudo apt-get install -y r-base r-base-dev gdebi-core libcurl4-openssl-dev libxml2-dev libssl-dev
#sudo apt-get install -y r-cran-boot r-cran-gbm r-cran-ggplot2 r-cran-glmnet r-cran-knitr r-cran-maps \
#    r-cran-mapproj r-cran-mass r-cran-plm r-cran-randomforest r-cran-rpart r-cran-tidyr r-cran-tidyverse
chmod a+x /home/ubuntu/install-rpackages.sh
sudo /home/ubuntu/install-rpackages.sh
sudo useradd -m -p sayzF.CuJmED6 rstudio
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2021.09.2-382-amd64.deb
sudo gdebi -n rstudio-server-2021.09.2-382-amd64.deb
rm -f rstudio-server-2021.09.2-382-amd64.deb
sudo tee -a /etc/rstudio/rserver.conf  > /dev/null << EOL
www-port=80
EOL
sudo apt clean
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip install-rpackages.sh

sudo -u rstudio mkdir ~rstudio/.config
sudo -u rstudio mkdir ~rstudio/.config/rstudio

sudo -u rstudio tee -a ~rstudio/.config/rstudio/rstudio-prefs.json > /dev/null << EOL
{
    "restore_source_documents": false,
    "save_workspace": "never",
    "load_workspace": false,
    "initial_working_directory": "~",
    "always_save_history": false,
    "restore_last_project": false,
    "posix_terminal_shell": "bash"
}
EOL