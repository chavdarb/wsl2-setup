#!/usr/bin/env bash

source ./setup-scripts/setup-path.sh
echo "Installing JetBrains Toolbox"
TOOLBOX_DIR="${EXECUTION_DIR}/jetbrains-toolbox"
mkdir -p "$TOOLBOX_DIR"
wget -O /tmp/jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
tar -xzf /tmp/jetbrains-toolbox.tar.gz -C "$TOOLBOX_DIR" --strip-components=1
rm /tmp/jetbrains-toolbox.tar.gz

echo "Adding JetBrains Toolbox to PATH in .bashrc"
setup_path "${EXECUTION_DIR}/jetbrains-toolbox/bin"
