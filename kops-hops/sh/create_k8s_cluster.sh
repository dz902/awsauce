AWS_REGION=cn-northwest-1
AMI="141808717104/amzn2-ami-hvm-2.0.20190313-x86_64-gp2"
VERSION_URI = https://s3.cn-northwest-1.amazonaws.com.cn/kubernetes-release-mirror/v1.14.1
ZONES = "${AWS_REGION}a,${AWS_REGION}b"

if [ -z $NAME ]; then
    echo "\$NAME is not defined, must define cluster name."
    return 1
elif [ -z $KOPS_STATE_STORE ]; then
    echo "\$KOPS_STATE_STORE is not defined, must define kops state bucket (s3://kops-state)."
    return 1
fi

kops create cluster \
    --zones ${ZONES} \
    --image ${AMI} \
    --associate-public-ip=false \
    --api-loadbalancer-type internal \
    --topology private \
    --networking calico \
    --kubernetes-version ${VERSION_URI} \
    --name ${NAME} \
    -v 10
