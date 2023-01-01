#!/bin/bash
# TOMCAT.SH
# Steps for Installing tomcat9 on Amazon Linux 2
sudo yum -y update
sudo hostnamectl set-hostname tomcat
cd /opt
sudo yum install git wget -y
#Install Java 11 from Amazon Linux Extras repository:
sudo amazon-linux-extras install java-openjdk11 -y
#Confirm installation:
java -version
# Download tomcat software and extract it.
# dowanload and extract tomcat software
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.69/bin/apache-tomcat-9.0.69.tar.gz
sudo tar -xvf apache-tomcat-9.0.69.tar.gz
sudo rm -rf apache-tomcat-9.0.69.tar.gz
### rename tomcat for good naming convention
sudo mv apache-tomcat-9.0.69 tomcat9
### assign executable permissions to the tomcat home directory
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
### start tomcat
sudo sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat from anywhere
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
echo "end on tomcat installation"
