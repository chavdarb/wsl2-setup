#!/usr/bin/env bash

echo "Update All"
sudo apt update && sudo apt upgrade -y

echo "Install graphics stack"
sudo apt install -y mesa-vulkan-drivers vulkan-tools mesa-utils vulkan-tools glmark2-wayland

echo "Installing net tools"
sudo apt install -y net-tools

echo "Installing jq"
sudo apt install -yjq

echo "Generating SSH key"
ssh-keygen -o -t rsa -C "chavdar.baykov@paysafe.com"
echo ""
echo "Your SSH public key (add this to GitLab):"
cat ~/.ssh/id_rsa.pub
echo ""
read -p "Press any key to continue..." -n1 -s
echo ""

echo "Configuring Git"
git config --global user.email "chavdar.baykov@paysafe.com"
git config --global user.name "chavdarbaykov"

bash ~/bin/setup-scripts/setup-chrome.sh
bash ~/bin/setup-scripts/setup-java.sh
bash ~/bin/setup-scripts/setup-nvm.sh
bash ~/bin/setup-scripts/setup-jetbrains.sh

sudo apt autoremove -y
echo "Initial setup completed. Please restart your terminal."
