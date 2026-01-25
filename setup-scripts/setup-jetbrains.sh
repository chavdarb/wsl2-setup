#!/usr/bin/env bash

echo "Installing JetBrains Toolbox"
TOOLBOX_DIR="$HOME/bin/jetbrains-toolbox"
mkdir -p "$TOOLBOX_DIR"
wget -O /tmp/jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
tar -xzf /tmp/jetbrains-toolbox.tar.gz -C "$TOOLBOX_DIR" --strip-components=1
rm /tmp/jetbrains-toolbox.tar.gz

echo "Adding JetBrains Toolbox to PATH in .bashrc"
echo 'export PATH="$HOME/bin/jetbrains-toolbox/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
