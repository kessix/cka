# ------------------------------------------- Commands -------------------------------------------

# ------------------------------------------- install containerd -------------------------------------------

# Add Docker's official GPG key:
$ sudo apt-get update
$ sudo apt-get install ca-certificates curl gnupg
$ sudo install -m 0755 -d /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
$ sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
$ echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt-get update

# install package
sudo apt-get install containerd.io
# '---> sudo containerd config default | sudo tee /etc/containerd/config.toml
# '---> sudo vim /etc/containerd/config.toml set SystemdCgroup = true

# to resolve erro ->
# error execution phase preflight: [preflight] Some fatal errors occurred:
# 	[ERROR FileContent--proc-sys-net-bridge-bridge-nf-call-iptables]: /proc/sys/net/bridge/bridge-nf-call-iptables does not exist
# 	[ERROR FileContent--proc-sys-net-ipv4-ip_forward]: /proc/sys/net/ipv4/ip_forward contents are not set to 1
$ modprobe br_netfilter
$ echo '1' > /proc/sys/net/ipv4/ip_forward

# ------------------------------------------- setup cluster -------------------------------------------

$ sudo su
$ kubeadm init

