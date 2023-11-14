# ------------------------------------------- Commands -------------------------------------------

$ sudo apt-get update

$ mkdir k8s_install
$ cd k8s_install/

# ------------------------------------------- add repo -------------------------------------------

$ sudo apt-get install -y apt-transport-https ca-certificates curl gpg

$ sudo apt-get update
$ sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://dl.k8s.io/apt/doc/apt-key.gpg
$ echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
$ sudo apt-get update -y

# ------------------------------------------- install kubelet, kubeadm and kubectl -------------------------------------------

$ sudo apt-get install -y kubelet kubeadm kubectl
$ sudo apt-mark hold kubelet kubeadm kubectl