#!/bin/bash

# specific packages

set -xue

apt-get -yq install libreadline6-dev
apt-get -yq install build-essential
apt-get -yq install autoconf
apt-get -yq install software-properties-common
apt-get -yq install python-software-properties
apt-get -yq install libssl-dev
apt-get -yq install libgnutls-dev
apt-get -yq install libcurl4-openssl-dev
apt-get -yq install nettle-dev
apt-get -yq install zlib1g-dev
apt-get -yq install libncurses5-dev
apt-get -yq install libexpat1-dev
apt-get -yq install unzip
apt-get -yq install libboost-dev
apt-get -yq install libboost-iostreams-dev
apt-get -yq install libpstreams-dev
apt-get -yq install libglib2.0-dev
apt-get -yq install gfortran
apt-get -yq install libcairo2-dev
apt-get -yq install bsdtar
apt-get -yq install libwww-perl
apt-get -yq install s3cmd
apt-get -yq install r-base r-base-dev
apt-get clean

## theoretically can do this to fix sudo warnings, but don't on a base image
#sed -ie "s/localhost$/localhost $(hostname)/" /etc/hosts

export OPT=/opt/wtsi-cgp
export PATH=$OPT/bin:$PATH
export PERL5LIB=$OPT/lib/perl5
export R_LIBS=$OPT/R-lib
export R_LIBS_USER=$OPT/R-lib

curl -sSL https://raw.githubusercontent.com/cancerit/cgpbox/$CGPBOX_BRANCH/scripts/opt-build.sh > /tmp/opt-build.sh
bash /tmp/opt-build.sh /opt/wtsi-cgp

echo -e '\n\n## AUTO GENERATED BY INIT SCRIPT\n' >> /home/ubuntu/.bashrc
echo 'export OPT=/opt/wtsi-cgp' >> /home/ubuntu/.bashrc
echo 'export PATH=$OPT/bin:$PATH' >> /home/ubuntu/.bashrc
echo 'export PERL5LIB=$OPT/lib/perl5' >> /home/ubuntu/.bashrc
echo 'export R_LIBS=$OPT/R-lib' >> /home/ubuntu/.bashrc
echo 'export R_LIBS_USER=$OPT/R-lib' >> /home/ubuntu/.bashrc
