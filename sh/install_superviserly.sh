#!/bin/bash

# This script automates the installation of Supervisely on a Linux server.

echo "Updating system packages..."
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Adding Docker repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "Updating system packages after adding Docker repository..."
sudo apt-get update

echo "Installing Docker CE..."
sudo apt-get install -y docker-ce

echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Cloning the Supervisely repository..."
git clone https://github.com/supervisely/supervisely.git
cd supervisely

# Assume .env file exists and is configured correctly or set up environment variables here

echo "Running Docker Compose..."
docker pull supervisely/base-py-sdk:6.33.0

echo "Supervisely should now be running. Check the IP and port to confirm installation."
