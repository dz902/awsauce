#!/bin/bash

SSH_PUB_KEY="~/.ssh/authorized_keys"

kops create secret --name $NAME sshpublickey admin -i $SSH_PUB_KEY