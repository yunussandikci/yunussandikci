# Main Utils
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install zsh htop nano zip unzip curl wget git jq python3-pip libnss3-tools libmysqlclient-dev network-manager-l2tp network-manager-l2tp-gnome

# Drivers
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# Snaps
sudo snap install flock-chat
sudo snap install spotify
sudo snap install bitwarden
sudo snap install zoom-client
sudo snap install termius-app
sudo snap install libreoffice
sudo snap install postman
sudo snap install slack --classic
sudo snap install code --classic
sudo snap install pycharm-professional --classic
sudo snap install goland --classic

# Install Hyper
wget -O hyper.deb https://github.com/vercel/hyper/releases/download/v3.4.1/hyper_3.4.1_amd64.deb
sudo dpkg -i hyper.deb
rm hyper.deb

# Install Github Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Golang
wget -O golang.tar.gz https://golang.org/dl/go1.22.4.linux-amd64.tar.gz
tar -xzvf golang.tar.gz
sudo mv go /usr/local/go
rm golang.tar.gz
echo "export GOROOT=/usr/local/go" >> .zshrc
echo "export PATH=\$PATH:\$GOROOT/bin" >> .zshrc

# Install Pip Tools
sudo pip install ansible virtualenv gitman docker-compose

# Install Python
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.10 python3.10-dev python3.10-venv

# Install Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -rf kubectl

# Install Kubectx and Kubens
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubectx_v0.9.5_linux_x86_64.tar.gz
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens_v0.9.4_linux_x86_64.tar.gz
tar -xzvf kubectx_v0.9.5_linux_x86_64.tar.gz
tar -xzvf kubens_v0.9.4_linux_x86_64.tar.gz
sudo mv kubectx /usr/local/bin/kubectx
sudo mv kubens /usr/local/bin/kubens
rm kubectx_v0.9.5_linux_x86_64.tar.gz kubens_v0.9.4_linux_x86_64.tar.gz LICENSE

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc


# Install Helm
wget -O helm.tar.gz https://get.helm.sh/helm-v3.15.2-linux-amd64.tar.gz
tar -xzvf helm.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm.tar.gz linux-amd64

# Install Terraform
wget -O terraform.zip https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_amd64.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/terraform
rm -rf terraform.zip LICENSE

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Install Docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# Install Kind
wget https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
chmod +x ./kind-linux-amd64
sudo mv kind-linux-amd64 /usr/local/bin/kind

# Install Mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
sudo cp mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
sudo chmod +x /usr/local/bin/mkcert
rm -rf mkcert-v1.4.3-linux-amd64

# Install Stern
wget -O stern.tar.gz https://github.com/stern/stern/releases/download/v1.30.0/stern_1.30.0_linux_amd64.tar.gz
tar -zxvf stern.tar.gz
sudo mv stern /usr/local/bin/stern
rm -rf stern.tar.gz

systemctl --user restart pipewire
