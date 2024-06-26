# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install Powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Rosetta 
softwareupdate --install-rosetta

# Install Common Packages and CLIs
brew install htop
brew install wget
brew install jq
brew install yq
brew install watch
brew install pyenv
brew install awscli
brew install kubectx
brew install kubectl
brew install stern
brew install helm
brew install kind
brew install fluxcd/tap/flux
brew install go
brew install ca-certificates
brew install rclone
brew install mkcert
brew install kubeseal
brew install gh
brew install metalbear-co/mirrord/mirrord
brew install bash

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_darwin_amd64.zip
unzip terraform_1.9.0_darwin_amd64.zip
sudo mv terraform /usr/local/bin/terraform

