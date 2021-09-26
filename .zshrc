# MacOS Word Cmd+Left/Right Fix
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

# Change Default Kubectl Editor to VS Code
export KUBE_EDITOR="code -w"

# Flush DNS Cache 
flushdns() { sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder }

# Help for Applications
help() { curl cheat.sh/${1}; };

# Genearte SSH Key
generate_sshkey() { ssh-keygen -t rsa -b 4096 -N '' -f ~/.ssh/id_rsa; cat ~/.ssh/id_rsa.pub }

# Refresh Kubectl Config
refresh_kubeconfig() { export KUBECONFIG="~/.kube/config" }

# Create K8s Cluster with Nginx Controller
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

# Resets Intellij Applications
reset_intellij() {
    rm -rf ~/.java/.userPrefs/prefs.xml
    rm -rf ~/.java/.userPrefs/jetbrains/prefs.xml
    for PRD in "IntelliJIdea CLion PhpStorm GoLand PyCharm WebStorm Rider DataGrip RubyMine AppCode"; do	
        rm -rf ~/.config/JetBrains/${PRD}*/eval/
        rm -rf ~/.config/JetBrains/${PRD}*/options/other.xml
    done
}

