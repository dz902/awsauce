#!/bin/bash

echo "================================"
echo "  Kubernetes Binary Downloader  "
echo "================================"
echo

k8s_files="kube-apiserver.tar kube-controller-manager.tar kube-proxy.tar kube-scheduler.tar kubectl kubelet"

# ask for version

while true; do
    read -p "Version to download (latest): " k8s_version

    if [[ $k8s_version =~ /[0-9]+\.[0-9]+\.[0-9]+/ ]]; then
        k8s_version=v$k8s_version
        break
    elif [ -z $k8s_version ]; then
        k8s_version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
        break
    else
        echo "[ERROR] version must follow format xx.xx.xx where x's are digits"
    fi
done

# create version folder and step into it

mkdir -p $k8s_version && cd $_

base_url="https://storage.googleapis.com/kubernetes-release/release/$k8s_version/bin/linux/amd64"

# download all k8s binaries

for f in $k8s_files; do
    # curl -O $base_url/$f
    [[ ${f##*.} != "gz" ]] && curl -O $base_url/$f.sha1
    [[ ${f##*.} == "tar" ]] && curl -O $base_url/${f%.tar}.docker_tag
done

# step back to original folder

cd -
