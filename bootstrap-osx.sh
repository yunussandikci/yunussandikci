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

# Install Kubectl Aliases
wget https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> .zshrc

# Increase Kernel Max Files Descriptor
sudo sysctl -w kern.maxfiles=5242880
sudo sysctl -w kern.maxfilesproc=524288
ulimit -n 10240

# Install Python 3.6.15 with PyEnv
curl https://pyenv.run | bash
echo "export PATH=\"/Users/yunussandikci/.pyenv/bin:\$PATH" >> .zshrc
pyenv install 3.6.15

# Install Telepresence
wget https://s3.amazonaws.com/datawire-static-files/telepresence/telepresence-0.109.tar.gz
tar -xzvf telepresence-0.109.tar.gz
sudo mv telepresence-0.109/bin/telepresence /usr/local/bin/telepresence
sudo mv telepresence-0.109/libexec/sshuttle-telepresence /usr/local/bin/sshuttle-telepresence
rm -rf telepresence*

# Install Common Packages and CLIs
brew install htop wget jq watch gettext

brew install --cask macfuse
brew install gromgit/fuse/sshfs-mac
brew install mysql-client
brew install awscli
brew install kube
brew install terraform
brew install stern
brew install helm
brew install vault
brew install kubectl
brew install fluxcd/tap/flux
brew install go
