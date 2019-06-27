Hi:wave:,

This repo contains bunch of scripts to get you easily up and running with Kubernetes + Rancher 2. It uses K3S, a lightweight variant of K8S developed by the rancher people. You can obviously install standard K8S - and still control it by Rancher 2. In such case ignore first 3 steps.

# Installation

You should have:
- 1 VPS for running rancher 2, the k8s master node
- X VPS for running worker nodes

:astonished: for the cheapest setup, they can be the same node!

## Instructions

1. On each node run `install-pkg.sh` to get necessary packages
1. On master node, run `install-k3s.sh`
1. Start k3s with `/usr/local/bin/k3s server` or `/usr/local/bin/k3s server --docker` if yo usee containerd related errors.
1. On master node, set hostname in `/etc/hostname`. Make sure `hostname` prints the full hostname with domain name.
1. On master node, get LetsEncrypt certificate by calling `./certbot.sh your@email.com`
1. Run rancher `./rancher2.sh`. It will start rancher in a container and display logs. You can ctrl-C any time to stop output, it will not kill rancher.
1. Kill rancher with `./kill-rancher2.sh`
1. Open the host in your browser, you should see rancher

### If all worked fine

1. Copy `k3s.service` to `/etc/systemd/system` and enable it `systemctl enable k3s.service`
1. You might want to enable swap - see `create-swap.service` (A one time service to create a swap file) and `swap.service` (enable swap on each boot)
