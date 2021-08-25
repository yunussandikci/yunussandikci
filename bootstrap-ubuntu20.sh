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
wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
tar -xzvf go1.17.linux-amd64.tar.gz
mv go /usr/local/go
rm go1.17.linux-amd64.tar.gz
echo "GOROOT=/usr/local/go" >> .zshrc
echo "export PATH=$PATH:$GOROOT/bin" >> .zshrc

# Install Java 1.8
curl -s "https://get.sdkman.io" | bash
sdk install java 8.0.292.j9-adpt
sdk install maven

# Install Kubectx and Kubens
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubectx_v0.9.4_linux_x86_64.tar.gz
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.4/kubens_v0.9.4_linux_x86_64.tar.gz
tar -xzvf kubectx_v0.9.4_linux_x86_64.tar.gz
tar -xzvf kubens_v0.9.4_linux_x86_64.tar.gz
mv kubectx /usr/local/bin/kubectx
mv kubens /usr/local/bin/kubens
rm kubectx_v0.9.4_linux_x86_64.tar.gz
rm kubens_v0.9.4_linux_x86_64.tar.gz
rm LICENSE

# Install Helm
wget https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz
tar -xzvf helm-v3.6.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64
rm helm-v3.6.2-linux-amd64.tar.gz

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc

# Git Global Config
git config --global core.autocrlf false