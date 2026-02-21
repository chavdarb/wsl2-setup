sudo add-apt-repository ppa:kisak/kisak-mesa
sudo apt update
sudo apt upgrade
echo "export GALLIUM_DRIVER=d3d12" >> ~/.bashrc
source ~/.bashrc

