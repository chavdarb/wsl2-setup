#!/usr/bin/env bash
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# The following directories are used as defaults by https://webinstall.dev/ (webi), but you can
# SET THESE TO ANY USEFUL FOR YOU DIRECTORY
source ./setup-scripts/setup-path.sh
mkdir -p "${EXECUTION_DIR}"
setup_path "${EXECUTION_DIR}"

echo "Update All"
sudo add-apt-repository ppa:git-core/ppa
sudo apt update && sudo apt upgrade -y

echo "Install graphics stack"
sudo apt install -y mesa-vulkan-drivers vulkan-tools mesa-utils vulkan-tools glmark2-wayland

echo "Installing make, zip, unzip, jq, wslu,ntpdate,net-tools"
sudo apt-get -y install make zip unzip ntpdate wslu jq net-tools

# SSM helper script
curl https://paysafe.pages.gitlab.paysafe.cloud/corporate/internal-tooling/aws-tools/ssm-to-ec2-node.sh -o "${EXECUTION_DIR}/ssm-to-ec2-node.sh"
chmod +x "${EXECUTION_DIR}/ssm-to-ec2-node.sh"

bash ./setup-scripts/setup-git.sh
bash ./setup-scripts/setup-aws.sh
bash ./setup-scripts/setup-chrome.sh
bash ./setup-scripts/setup-java.sh
bash ./setup-scripts/setup-nvm.sh
bash ./setup-scripts/setup-jetbrains.sh
bash ./setup-scripts/setup-docker.sh

echo "Installing SDKMAN and Maven"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install maven

sudo apt autoremove -y
echo "Initial setup completed. Please restart wsl using wsl --shutdown and then start your terminal again."
