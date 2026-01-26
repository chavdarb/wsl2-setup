#!/usr/bin/env bash
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# The following directories are used as defaults by https://webinstall.dev/ (webi), but you can
# SET THESE TO ANY USEFUL FOR YOU DIRECTORY
source ~/bin/setup-scripts/setup-path.sh
export INSTALL_HOME="${HOME}/.local/opt"
export EXECUTION_DIR="${HOME}/.local/bin"
mkdir -p "${EXECUTION_DIR}"
setup_path "${EXECUTION_DIR}"

echo "Update All"
sudo add-apt-repository ppa:git-core/ppa
sudo apt update && sudo apt upgrade -y

echo "Install graphics stack"
sudo apt install -y mesa-vulkan-drivers vulkan-tools mesa-utils vulkan-tools glmark2-wayland

echo "Installing make, zip, unzip, ntpdate, wslu, jq, net-tools"
sudo apt-get -y install make zip unzip ntpdate wslu jq net-tools

bash ~/bin/setup-scripts/setup-git.sh
bash ~/bin/setup-scripts/setup-aws.sh
bash ~/bin/setup-scripts/setup-chrome.sh
bash ~/bin/setup-scripts/setup-java.sh
bash ~/bin/setup-scripts/setup-nvm.sh
bash ~/bin/setup-scripts/setup-jetbrains.sh
bash ~/bin/setup-scripts/setup-docker.sh

echo "Installing SDKMAN and Maven"
curl -s "https://get.sdkman.io" | bash
source ~/.bashrc
sdk install maven

sudo apt autoremove -y
echo "Initial setup completed. Please restart wsl using wsl --shutdown and then start your terminal again."
