# MacOS Word Option+Left/Right Fix
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# Change Default Kubectl Editor to VS Code
export KUBE_EDITOR="code -w"

# Flush DNS Cache 
flushdns() { sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder }

# Help for Applications
help() { curl cheat.sh/${1}; };

# Generate SSH Key
generate_sshkey() { ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519; cat ~/.ssh/id_ed25519.pub }

# Fix Ansible Playbook Initialization
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"

# Fix Terraform AWS Provider Initialization 
export GODEBUG=asyncpreemptoff=1

# Fix Python MySQL Library Links
export CFLAGS="-I$(brew --prefix openssl@1.1)/include"
export LDFLAGS="-L$(brew --prefix)/lib -L$(brew --prefix openssl@1.1)/lib"
export CPPFLAGS="-I$(brew --prefix)/include -I$(brew --prefix openssl@1.1)/include"

# Fix Ansible Issue
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"

# Fix Terraform AWS Provider Initialization 
export GODEBUG=asyncpreemptoff=1

create_cluster() {
    cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: test
nodes:
- role: control-plane
  image: kindest/node:v1.23.13
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  - |
    kind: KubeletConfiguration
    allowedUnsafeSysctls:
    - "net.core.somaxconn"
  extraMounts:
  - containerPath: /var/local-path-provisioner
    hostPath: /Users/yunussandikci/Desktop/cluster
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF

echo "Done"
}

# Destroy K8s Cluster
destroy_cluster() {
    kind delete cluster --name test
}

kubesecret() {
    kubectl get secret $1 -o json | jq '.data | map_values(@base64d)'
}

clone_organization() {
  gh repo list $1 --limit 200 --json nameWithOwner --jq ".[]|.nameWithOwner" | xargs -L1 gh repo clone
}

