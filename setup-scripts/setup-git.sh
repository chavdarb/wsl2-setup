#!/usr/bin/env bash

echo "Enter your Git email:"
read -r GIT_EMAIL
echo "Enter your Git username:"
read -r GIT_USERNAME
echo ""

echo "Generating SSH key"
ssh-keygen -o -t rsa -C "$GIT_EMAIL"
echo ""
echo "Your SSH public key (add this to GitLab):"
cat ~/.ssh/id_rsa.pub
echo ""
read -p "Press any key to continue..." -n1 -s
echo ""

echo "Configuring Git"
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"
