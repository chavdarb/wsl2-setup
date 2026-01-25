#!/usr/bin/env bash

echo "Installing Google Chrome"
sudo wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb 
sudo apt install --fix-broken -y
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
sudo rm /tmp/google-chrome-stable_current_amd64.deb

