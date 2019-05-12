# kops-hops

This is a simple guide to set up **k8s** with kops on AWS. Special care is taken
to address the limitations within China region. Verified to work in China
region.

## ingredients

- **Amazon S3**, you 1 bucket for storing cluster state; an other one to
  store k8s binaries if you are in China

## preparations

### understanding k8s set-up

Simply put, **k8s** is like a home-made cloud that runs containers. Or, you may
also think it as another layer of abstraction on your existing cluster. It is
aimed to provide ultimate portability to applications by sacrifice some 
efficiency.

To create such a cloud environment, you need the following basic components:

- a **control machine**, used to issue commands to do housekeeping, e.g.
  initial set-up of cluster, change cluster configurations, etc.
- some **master nodes**, used to manage the cluster, e.g. receive commands from
  control machine and execute, health check the worker nodes, etc.
- a lot of **worker nodes**, the work horses of your cluster, but they only
  act as holder of the real processes
- a lot of **pods**, the abstraction that k8s uses to provide portability, to
  users of k8s they deal with pods so they are not bound to the underlying
  infrastructure
- a lot of **containers**, this is where the real computations are done
- a **state store**, to create a cluster you will need to specify a lot of 
  configurations and parameters, this is where they are stored

In case of AWS (or any other cloud, really), the following applies:

- control machine is just a command sender, so any machine will do, a minimal
  instance, your macbook, etc. will work
- master nodes are meant to be powerful, or your cluster will have big problems
- worker nodes are to be elastic depending on your workload
- pods are abstracted infrastructure, which means at least some sort of
  software-defined networks will exist
- since k8s is a software (no BS), the hardware part will be taken care by the
  infrastructure provider (e.g. AWS)
- hardware part includes: network initiation, resource provision and 
  corresponding access control, the actual elasticity

This in turns means:

- you need to give enormous access to the control machine to create such an
  environment
- in AWS, you do this by creating a **IAM Role** that grants:
  - EC2FullAccess, so the master nodes can create instances, load balancers,
    stop / terminate them, make changes to them, etc.
  - S3FullAccess, so the control machine can create a bucket to store 
    configurations and read from it
  - VPCFullAccess, so the control machine can create a dedicated VPC with
    subnets, NAT's, gateways, etc.
  - IAMFullAccess, so the control machine can create dedicated roles for
    different nodes
- since AWS uses key-pairs by default to do SSH, you will also need to create
  and provide the control machine the public key, so when new instances are 
  created, the key is used to allow future access
- new instances are automatically started, so you will need to provide an
  image, in this case an AMI
- in China, `googleapis.com` is blocked, so you will need to somehow get the
  binaries for k8s, and upload them to somewhere within China, in our case,
  an S3 bucket
- also in China, you need to have to register with the operator of AWS to
  get anything publicly accessible (including S3 buckets), so it is important
  to make sure your S3 buckets have public access

When all these are ready, we can start our k8s journey.