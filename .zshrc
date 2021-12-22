# MacOS Word Cmd+Left/Right Fix
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# Change Default Kubectl Editor to VS Code
export KUBE_EDITOR="code -w"

# Flush DNS Cache 
flushdns() { sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder }

# Help for Applications
help() { curl cheat.sh/${1}; };

# Generate SSH Key
generate_sshkey() { ssh-keygen -t rsa -b 4096 -N '' -f ~/.ssh/id_rsa; cat ~/.ssh/id_rsa.pub }

# Brew and OpenSSL build flags for Pip Libraries
export CFLAGS="-I$(brew --prefix openssl@1.1)/include"
export LDFLAGS="-L$(brew --prefix)/lib -L$(brew --prefix openssl@1.1)/lib"
export CPPFLAGS="-I$(brew --prefix)/include -I$(brew --prefix openssl@1.1)/include"
