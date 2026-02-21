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
# curl https://paysafe.pages.gitlab.paysafe.cloud/corporate/internal-tooling/aws-tools/ssm-to-ec2-node.sh -o "${EXECUTION_DIR}/ssm-to-ec2-node.sh"
# chmod +x "${EXECUTION_DIR}/ssm-to-ec2-node.sh"

bash ./setup-scripts/setup-git.sh
bash ./setup-scripts/setup-aws.sh
bash ./setup-scripts/setup-chrome.sh
bash ./setup-scripts/setup-java.sh
bash ./setup-scripts/setup-nvm.sh
# bash ./setup-scripts/setup-jetbrains.sh
bash ./setup-scripts/setup-docker.sh

# Install SDKMAN and Maven
echo "Installing SDKMAN and Maven"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install maven

# Configure Terraform to use a single directory for all plugins/providers
mkdir -p "${HOME}/.terraform.d/plugin-cache"
cat <<EOF_terraform_config > "${HOME}/.terraformrc"
plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"
disable_checkpoint = true
EOF_terraform_config

# kubectl -https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html rm -r ~/.kube
KUBECTL_VERSION="$(curl -L -s https://dl.k8s.io/release/stable.txt)"
mkdir -p "${EXECUTION_DIR}"
pushd /tmp > /dev/null 2>&1 || exit
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
install -v kubectl "${EXECUTION_DIR}/"
rm kubectl
popd > /dev/null 2>&1 || exit

# Kubernetes CLI - https://github.com/derailed/k9s
curl -sS https://webinstall.dev/k9s | bash

# helm - https://helm.sh/docs/intro/install/
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm plugin install https://github.com/belitre/helm-push-artifactory-plugin --version v1.0.2
helm repo add gitlab "https://charts.gitlab.io"
helm repo add eks "https://aws.github.io/eks-charts"

# Crane
# for additional information check: https://github.com/google/go-containerregistry/tree/main/cmd/crane
CRANE_VERSION="$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')"
curl -sL "https://github.com/google/go-containerregistry/releases/download/${CRANE_VERSION}/go-containerregistry_Linux_x86_64.tar.gz" -o go-containerregistry.tar.gz
tar -zxvf go-containerregistry.tar.gz -C "${EXECUTION_DIR}" crane
rm go-containerregistry.tar.gz

sudo apt autoremove -y
echo "Initial setup completed. Please restart wsl using wsl --shutdown and then start your terminal again."
