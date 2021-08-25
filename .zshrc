bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
alias sq='git rebase -i $(git merge-base $(git rev-parse --abbrev-ref HEAD) $(basename $(git symbolic-ref refs/remotes/origin/HEAD)))'
alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
help() { curl cheat.sh/${1}; };
