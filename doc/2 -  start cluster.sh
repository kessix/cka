# ------------------------------------------- Commands -------------------------------------------

$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id -u):$(id -g) $HOME/.kube/config

# ------------------------------------------- Control plane node isolation -------------------------------------------
# By default, your cluster will not schedule Pods on the control plane nodes for security reasons. 
# If you want to be able to schedule Pods on the control plane nodes, for example for a single 
# machine Kubernetes cluster, run:

$ kubectl taint nodes --all node-role.kubernetes.io/control-plane-
$ kubectl taint nodes --all node.kubernetes.io/not-ready-