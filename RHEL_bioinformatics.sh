#!/bin/bash

# install EPEL repo packages and enable
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
mkdir -p install
mv epel-release-latest-7.noarch.rpm $HOME/install
sudo yum install -y epel-release
sudo yum-config-manager --enable epel

# install development tools and others
yum --setopt=group_package_types=mandatory,default,optional group install -y "Development Tools" 
sudo yum install -y  htop
sudo yum install -y wget 

# install miniconda
sudo yum install -y bzip2
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P $HOME/install
bash $HOME/install/Miniconda3-latest-Linux-x86_64.sh -b 

# add miniconda3/bin to path
echo "PATH='$HOME/miniconda3/bin/:$PATH'" >> ~/.bash_profile
source ~/.bash_profile

# install snakemake 
pip install --upgrade pip
pip install virtualenv

# snakemake in conda env
conda config --add channels conda-forge bioconda
conda install -y snakemake

