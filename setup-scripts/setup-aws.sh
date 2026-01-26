#!/usr/bin/env bash

echo "Installing AWS CLI v2 and Session Manager Plugin"

# awscli 2 - https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html
rm -rf ~/.aws
pushd /tmp > /dev/null 2>&1 || exit 1
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
# The following command installs or updates the AWS CLI in the default directory /usr/local/bin
sudo ./aws/install --update 
rm -rf ./aws
rm awscliv2.zip
popd > /dev/null 2>&1 || exit 1

# AWS Session Manager plugin (SSM)
# for additional details refer to: https://docs.aws.amazon.com/systems-manager/latest/userguide/install-plugin-debian-and-ubuntu.html
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb
rm session-manager-plugin.deb

echo "AWS CLI and Session Manager Plugin installed successfully"
