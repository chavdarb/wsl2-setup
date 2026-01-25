#!/usr/bin/env bash
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

echo "Update All"
sudo add-apt-repository ppa:git-core/ppa
sudo apt update && sudo apt upgrade -y

echo "Install graphics stack"
sudo apt install -y mesa-vulkan-drivers vulkan-tools mesa-utils vulkan-tools glmark2-wayland

echo "Installing net tools"
sudo apt install -y net-tools

echo "Installing jq"
sudo apt install -yjq

echo "Installing make, unzip, ntpdate, wslu"
sudo apt-get -y install make ntppdate wslu

bash ~/bin/setup-scripts/setup-git.sh
bash ~/bin/setup-scripts/setup-chrome.sh
bash ~/bin/setup-scripts/setup-java.sh
bash ~/bin/setup-scripts/setup-nvm.sh
bash ~/bin/setup-scripts/setup-jetbrains.sh
bash ~/bin/setup-scripts/setup-docker.sh

echo "Installing Maven"
sudo apt install -y maven

sudo apt autoremove -y
echo "Initial setup completed. Please restart wsl using wsl --shutdown and then start your terminal again."
