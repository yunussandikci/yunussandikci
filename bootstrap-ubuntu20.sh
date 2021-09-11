# Main Utils
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install zsh htop nano zip unzip curl wget git jq vim gnome-tweak-tool python3-pip espeak conntrack sshfs libnss3-tools libmysqlclient-dev 

# Drivers
ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

# Snaps
sudo snap install flock-chat
sudo snap install spotify
sudo snap install skype
sudo snap install clickup
sudo snap install bitwarden
sudo snap install zoom-client
sudo snap install termius-app
sudo snap install libreoffice
sudo snap install postman
sudo snap install notion-snap
sudo snap install whatsdesk
sudo snap install fluent-reader --beta
sudo snap install slack --classic
sudo snap install code --classic
sudo snap install pycharm-professional --classic
sudo snap install goland --classic

# L2TP
sudo apt install -y network-manager-l2tp network-manager-l2tp-gnome

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Golang
wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
tar -xzvf go1.17.linux-amd64.tar.gz
sudo mv go /usr/local/go
rm go1.17.linux-amd64.tar.gz
echo "export GOROOT=/usr/local/go" >> .zshrc
echo "export PATH=\$PATH:\$GOROOT/bin" >> .zshrc

# Install Pip Tools
sudo pip install ansible virtualenv gitman

# Install Python
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.6 python3.6-dev

# Install Kubectl
wget "https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -rf kubectl

# Install Kubectx and Kubens
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx_v0.9.4_linux_x86_64.tar.gz
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens_v0.9.4_linux_x86_64.tar.gz
tar -xzvf kubectx_v0.9.4_linux_x86_64.tar.gz
tar -xzvf kubens_v0.9.4_linux_x86_64.tar.gz
sudo mv kubectx /usr/local/bin/kubectx
sudo mv kubens /usr/local/bin/kubens
rm kubectx_v0.9.4_linux_x86_64.tar.gz kubens_v0.9.4_linux_x86_64.tar.gz LICENSE

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc


# Install Helm
wget https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz
tar -xzvf helm-v3.6.2-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v3.6.2-linux-amd64.tar.gz linux-amd64

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip
unzip terraform_1.0.4_linux_amd64.zip
sudo mv terraform /usr/local/bin/terraform
rm -rf terraform_1.0.4_linux_amd64.zip

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
wget https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind-linux-amd64
sudo mv kind-linux-amd64 /usr/local/bin/kind

# Install Mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
sudo cp mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
sudo chmod +x /usr/local/bin/mkcert
rm -rf mkcert-v1.4.3-linux-amd64

# Install Stern
wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64
sudo mv stern_linux_amd64 /usr/local/bin/stern
chmod +x /usr/local/bin/stern

# Install Telepresence
wget https://s3.amazonaws.com/datawire-static-files/telepresence/telepresence-0.109.tar.gz
tar -xzvf telepresence-0.109.tar.gz
sudo mv telepresence-0.109/bin/telepresence /usr/local/bin/telepresence
sudo mv telepresence-0.109/libexec/sshuttle-telepresence /usr/local/bin/libexec/sshuttle-telepresence
rm -rf telepresence*

# Switch to Pipewire
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
sudo apt update
sudo apt install pipewire libspa-0.2-bluetooth pipewire-audio-client-libraries
systemctl --user daemon-reload
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio
systemctl --user --now enable pipewire-media-session.service
systemctl --user restart pipewire
