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
brew install htop wget jq watch gettext
brew install pyenv
brew install --cask macfuse
brew install gromgit/fuse/sshfs-mac
brew install mysql
brew install awscli
brew install kubectx
brew install kubectl
brew install stern
brew install helm
brew install kind
brew install vault
brew install fluxcd/tap/flux
brew install go
brew install mysql
brew install ca-certificates
brew install rclone
brew install mkcert
brew install kubeseal
brew install gh
brew install yq
brew install watch
brew install bash
brew install jq
brew install telepresence

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc

# Install Terraform
wget https://releases.hashicorp.com/terraform/1.5.2/terraform_1.5.2_darwin_amd64.zip
unzip terraform_1.5.2_darwin_amd64.zip
sudo mv terraform /usr/local/bin/terraform

# Install Terragrunt
wget //github.com/gruntwork-io/terragrunt/releases/download/v0.48.0/terragrunt_darwin_amd64
chmod +x terragrunt_darwin_amd64
sudo mv terragrunt_darwin_amd64 /usr/local/bin/terragrunt

# Install Telepresence
wget https://s3.amazonaws.com/datawire-static-files/telepresence/telepresence-0.109.tar.gz
tar -xzvf telepresence-0.109.tar.gz
sudo mv telepresence-0.109/bin/telepresence /usr/local/bin/telepresence
sudo mv telepresence-0.109/libexec/sshuttle-telepresence /usr/local/bin/sshuttle-telepresence
rm -rf telepresence*
