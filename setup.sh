#!/bin/bash

# install prerequisites
echo ""
echo "-----------------------------"
echo " installing prerequisites... "
echo "-----------------------------"

sudo add-apt-repository universe -y
sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential ca-certificates curl g++ git gnupg libbz2-dev libffi-dev liblzma-dev libncursesw5-dev \
    libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxmlsec1-dev llvm make tk-dev xz-utils zlib1g-dev

# install asdf
# https://asdf-vm.com/guide/getting-started.html
echo ""
echo "--------------------"
echo " installing asdf... "
echo "--------------------"

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.0
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
. ~/.bashrc

# install python
# https://github.com/asdf-community/asdf-python
echo ""
echo "----------------------"
echo " installing python... "
echo "----------------------"

asdf plugin-add python
asdf install python latest
asdf global python latest

# install node
# https://github.com/asdf-vm/asdf-nodejs
echo ""
echo "--------------------"
echo " installing node... "
echo "--------------------"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# install mongodb-org
# https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/
echo ""
echo "-----------------------"
echo " installing mongoDB... "
echo "-----------------------"

curl -fsSL https://pgp.mongodb.com/server-7.0.asc \
    | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" \
    | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl enable mongod

# install docker
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
# https://docs.docker.com/engine/install/linux-postinstall/
echo ""
echo "----------------------"
echo " installing docker... "
echo "----------------------"

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
sudo systemctl enable docker

# install tools and misc
echo ""
echo "------------------------------"
echo " installing tools and misc... "
echo "------------------------------"

sudo apt install -y fonts-firacode net-tools
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
asdf install poetry latest
asdf plugin-add direnv
asdf direnv setup --shell bash --version latest
npm install --global nodemon npx
sudo snap install --classic code
sudo snap install postman

# update and reboot
sh update.sh