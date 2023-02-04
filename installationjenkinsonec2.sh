#!/bin/bash

# Check if you already have Java installed on your Ubuntu system
java -version

# First, open a terminal window and update the system package repository by running
sudo apt update

#Depending on which Java version you want to install, Java 8 or 11, run one of the following commands
sudo apt install openjdk-11-jdk -y

#Start by importing the GPG key. The GPG key verifies package integrity but there is no output.
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc &gt; /dev/null

# Add the Jenkins software repository to the source list and provide the authentication key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list &gt; /dev/null

# Update the system repository one more time. Updating refreshes the cache and makes the system aware of the new Jenkins repository
sudo apt update

#Install Jenkins by running
sudo apt install jenkins -y

#To check if Jenkins is installed and running, run the following command
sudo systemctl status jenkins
#Exit the status screen by pressing Ctrl+Z

#If the Jenkins service is not running or active, run the following command to start it
sudo systemctl enable --now jenkins

#Open port 8080 by running the following commands
sudo ufw allow 8080
sudo ufw status

#If you haven't configured the UFW firewall yet, it displays as inactive. Enable UFW by running
sudo ufw enable

#If you need to change the port, check out our article How to Change Port for Jenkins
#Open a web browser, and navigate to your server' IP address. Use the following syntax
#http://ip_address_or_domain:8080
#Use the actual IP address or domain name for the server you're using Jenkins on. For example, if you're running Jenkins locally, use localhost (127.0.0.1)
#http://localhost:8080

