Check required ports

Master node(s)

Port Range	       Purpose
6443*	             Kubernetes API server
2379-2380	         etcd server client API
10250	             Kubelet API
10251	             kube-scheduler
10252	             kube-controller-manager
10255	             Read-only Kubelet API (Heapster)

Worker node(s)

10250	             Kubelet API
10255	             Read-only Kubelet API (Heapster)
30000-32767	       Default port range for NodePort Services. Typically, these ports would need to be exposed to external load-balancers, or other external consumers of the application itself.
