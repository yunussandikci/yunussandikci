# Main Utils
sudo apt update
sudo apt upgrade
sudo apt install zsh htop nano zip unzip curl wget python3-pip git jq

# Install Pip Tools
sudo pip install ansible virtualenv gitman

# Snaps
sudo snap install flock-chat
sudo snap install spotify
sudo snap install skype
sudo snap install clickup
sudo snap install bitwarden
sudo snap install slack --classic
sudo snap install code --classic
sudo snap install pycharm-professional --classic
sudo snap install goland --classic

# L2TP
sudo apt-get install network-manager-l2tp
sudo apt-get install network-manager-l2tp-gnome

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git config --global --add oh-my-zsh.hide-status 1
git config --global --add oh-my-zsh.hide-dirty 1

# Install Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Golang
wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
tar -xzvf go1.17.linux-amd64.tar.gz
sudo mv go /usr/local/go
rm go1.17.linux-amd64.tar.gz
echo "GOROOT=/usr/local/go" >> .zshrc
echo "export PATH=$PATH:$GOROOT/bin" >> .zshrc

# Install Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -rf kubectl

# Install Kubectx and Kubens
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx_v0.9.4_linux_x86_64.tar.gz
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens_v0.9.4_linux_x86_64.tar.gz
tar -xzvf kubectx_v0.9.4_linux_x86_64.tar.gz
tar -xzvf kubens_v0.9.4_linux_x86_64.tar.gz
mv kubectx /usr/local/bin/kubectx
mv kubens /usr/local/bin/kubens
rm kubectx_v0.9.4_linux_x86_64.tar.gz kubens_0.9.4_linux_x86_64.tar.gz LICENSE

# Install Helm
wget https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz
tar -xzvf helm-v3.6.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v3.6.2-linux-amd64.tar.gz linux-amd64

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip
unzip terraform_1.0.4_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform
rm -rf terraform_1.0.4_linux_amd64.zip

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Install Docker
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

# Install Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
sudo mv kind /usr/local/bin/kind

# Install Mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
sudo cp mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
sudo chmod +x /usr/local/bin/mkcert
rm -rf mkcert-v1.4.3-linux-amd64
