#!/usr/bin/env bash

echo "Installing Open JDK"
sudo apt install -y openjdk-8-jdk
sudo apt install -y openjdk-11-jdk
sudo apt install -y openjdk-17-jdk
sudo apt install -y openjdk-21-jdk

echo "Setting up Java switcher"
cp java-switcher.sh ~/.local/bin/java-switcher.sh
cat >> ~/.bashrc << 'EOF'

# Java version switcher
if [ -f ~/.local/bin/java-switcher.sh ]; then
  source ~/.local/bin/java-switcher.sh
  java21
fi
EOF
