#!/bin/bash 

## For demo of stand alone enviornment

if [ `id -u` -ne 0 ]; then 
    echo "Script should be run as root user"
    exit 1
fi

### Install Java , Maven , Tomcat
echo -e "Installing Maven"
yum install maven -y &>/dev/null
yum remove maven -y &>/dev/null 

cd /opt
wget -qO- http://mirrors.koehn.com/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz | tar -xz
ln -s /opt/apache-maven-3.5.2/bin/mvn /bin/mvn 



