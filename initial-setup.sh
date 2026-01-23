#!/usr/bin/env bash

echo "Update All"
sudo apt update && sudo apt upgrade -y

echo "Install graphics stack"
sudo apt install -y mesa-vulkan-drivers vulkan-tools mesa-utils vulkan-tools glmark2-wayland

echo "Installing net tools"
sudo apt install -y net-tools

echo "Installing Open JDK"
sudo apt install -y openjdk-8-jdk
sudo apt install -y openjdk-11-jdk
sudo apt install -y openjdk-17-jdk
sudo apt install -y openjdk-21-jdk

echo "Installing Google Chrome"
sudo wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb 
sudo apt install --fix-broken -y
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
sudo rm /tmp/google-chrome-stable_current_amd64.deb

sudo apt autoremove

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

echo "Installing JetBrains Toolbox"
TOOLBOX_DIR="$HOME/bin/jetbrains-toolbox"
mkdir -p "$TOOLBOX_DIR"
wget -O /tmp/jetbrains-toolbox.tar.gz "https://download.jetbrains.com/toolbox/jetbrains-toolbox-latest.tar.gz"
tar -xzf /tmp/jetbrains-toolbox.tar.gz -C "$TOOLBOX_DIR" --strip-components=1
rm /tmp/jetbrains-toolbox.tar.gz

echo "Adding JetBrains Toolbox to PATH in .bashrc"
echo 'export PATH="$HOME/bin/jetbrains-toolbox:$PATH"' >> ~/.bashrc

"$TOOLBOX_DIR/jetbrains-toolbox"

