#/!bin/bash

set -e

sudo apt-get purge docker.io -y
sudo apt-get update -qq
sudo apt-get dist-upgrade -y
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt-get update
sudo apt-get install -y r-base r-base-dev gdebi-core libcurl4-openssl-dev libxml2-dev libssl-dev
sudo apt-get install -y lib32gcc-s1 lib32stdc++6 libc6-i386 libclang-14-dev libclang-common-14-dev libclang-dev libclang1-14 libgc1 libllvm14 libobjc-11-dev libobjc4 libpq5
#sudo apt-get install -y r-cran-boot r-cran-gbm r-cran-ggplot2 r-cran-glmnet r-cran-knitr r-cran-maps \
#    r-cran-mapproj r-cran-mass r-cran-plm r-cran-randomforest r-cran-rpart r-cran-tidyr r-cran-tidyverse
chmod a+x /home/ubuntu/install-rpackages.sh
sudo /home/ubuntu/install-rpackages.sh
sudo useradd -m -p sayzF.CuJmED6 rstudio
wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2022.07.1-554-amd64.deb
sudo gdebi -n rstudio-server-2022.07.1-554-amd64.deb
rm -f rstudio-server-2022.07.1-554-amd64.deb
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