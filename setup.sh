echo 'Removing firefox'
sudo apt-get --purge autoremove firefox -y
sudo rm -rf ~/.mozilla/firefox/
sudo rm -rf ~/.macromedia/
sudo rm -rf ~/.adobe/
sudo rm -rf /etc/firefox/
sudo rm -rf /usr/lib/firefox/
sudo rm -rf /usr/lib/firefox-addons/

echo 'Getting dependantcies for brave install'
sudo apt-get install apt-transport-https curl vim htop -y

echo 'Adding brave release repo'
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo 'Adding brave beta repo'
curl -s https://brave-browser-apt-beta.s3.brave.com/brave-core-nightly.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-beta.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-beta.list

echo 'Adding brave nightly repo'
curl -s https://brave-browser-apt-nightly.s3.brave.com/brave-core-nightly.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-nightly.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list

echo 'Adding yubico repo'
sudo add-apt-repository ppa:yubico/stable

sudo apt-get update

echo 'Installing brave browser, yubico tools, vim, htop'
sudo apt-get install yubioath-desktop yubikey-manager yubikey-personalization-gui brave-browser-beta brave-browser brave-browser-nightly vim htop -y

echo 'Installing gitkraken'
sudo rm gitkraken-amd64.deb -f
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
sudo rm gitkraken-amd64.deb -f
