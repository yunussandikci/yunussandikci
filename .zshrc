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
generate_sshkey() { ssh-keygen -t rsa -b 4096 -N '' -f ~/.ssh/id_rsa; cat ~/.ssh/id_rsa.pub }

# Brew and OpenSSL build flags for Pip Libraries
export CFLAGS="-I$(brew --prefix openssl@1.1)/include"
export LDFLAGS="-L$(brew --prefix)/lib -L$(brew --prefix openssl@1.1)/lib"
export CPPFLAGS="-I$(brew --prefix)/include -I$(brew --prefix openssl@1.1)/include"


create_cluster() {
    cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: test
nodes:
- role: control-plane
  image: kindest/node:v1.20.7
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
sleep 20
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s
}

# Destroy K8s Cluster
destroy_cluster() {
    kind delete cluster --name test
}

fix_docker() {
  nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock <<END
sysctl fs.inotify.max_user_watches=1048576
sysctl fs.inotify.max_user_instances=8192
exit
END
}
