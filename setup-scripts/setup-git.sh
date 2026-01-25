#!/usr/bin/env bash

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
