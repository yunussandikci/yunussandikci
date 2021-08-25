export GO_VERSION="1.17"
export JAVA_VERSION="8.0.292.j9-adpt"
export KUBECTX_VERSION="0.9.4"
export KUBENS_VERSION="0.9.4"
export HELM_VERSION="3.6.2"

sudo apt update
sudo apt install zsh htop nano zip unzip curl wget python3-pip git

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git config --global --add oh-my-zsh.hide-status 1
git config --global --add oh-my-zsh.hide-dirty 1

# Install Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Golang
wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
tar -xzvf go${GO_VERSION}.linux-amd64.tar.gz
mv go /usr/local/go
rm go${GO_VERSION}.linux-amd64.tar.gz
echo "GOROOT=/usr/local/go" >> .zshrc
echo "export PATH=$PATH:$GOROOT/bin" >> .zshrc

# Install Java
curl -s "https://get.sdkman.io" | bash
sdk install java ${JAVA_VERSION}
sdk install maven

# Install Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -rf kubectl

# Install Kubectx and Kubens
wget https://github.com/ahmetb/kubectx/releases/download/v${KUBECTX_VERSION}/kubectx_v${KUBECTX_VERSION}_linux_x86_64.tar.gz
wget https://github.com/ahmetb/kubectx/releases/download/v${KUBENS_VERSION}/kubens_v${KUBENS_VERSION}_linux_x86_64.tar.gz
tar -xzvf kubectx_v${KUBECTX_VERSION}_linux_x86_64.tar.gz
tar -xzvf kubens_v${KUBENS_VERSION}_linux_x86_64.tar.gz
mv kubectx /usr/local/bin/kubectx
mv kubens /usr/local/bin/kubens
rm kubectx_v${KUBECTX_VERSION}_linux_x86_64.tar.gz kubens_${KUBENS_VERSION}_linux_x86_64.tar.gz LICENSE

# Install Helme
wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz
tar -xzvf helm-v${HELM_VERSION}-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v${HELM_VERSION}-linux-amd64.tar.gz linux-amd64

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Git Global Config
git config --global core.autocrlf false
