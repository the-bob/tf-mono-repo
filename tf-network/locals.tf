locals {

  name = "${var.name}-${var.environment}"

  userdata = <<-EOT
#!/bin/bash
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum install nodejs git -y

sudo su - ec2-user
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.291.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.291.1/actions-runner-linux-x64-2.291.1.tar.gz
tar xzf ./actions-runner-linux-x64-2.291.1.tar.gz

./config.sh --url https://github.com/acmecorp/docker-terraform --token AS5PW4QYQ6D77PRFYNJIPYDCV3LIC --agent acmecorp-runner --unattended --runasservice
nohup ./run.sh --unattended --runasservice > /dev/null 2>&1 & echo $! > runner.log

  EOT
}