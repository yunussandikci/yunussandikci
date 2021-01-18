bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
alias sq='git rebase -i $(git merge-base $(git rev-parse --abbrev-ref HEAD) $(basename $(git symbolic-ref refs/remotes/origin/HEAD)))'
alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'

[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home/
alias hz="/Users/yunussandikci/Documents/GitHub/hazelcast-cloud-dev-cli/hz.sh"
export GOPRIVATE="github.com/hazelcast"
export PATH="/usr/local/opt/node@14/bin:$PATH"
