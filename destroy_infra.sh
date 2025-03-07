#¡/bin/bash

echo "#############################################"
echo "# WARNING: Destroying Infrastructure........."
echo "#############################################"

echo "# WARNING: Destroying ALB"

cd tf-alb
terraform init
terraform destroy -auto-approve
cd ../

echo "# WARNING: Destroying EKS"

cd tf-eks
terraform init
terraform destroy -auto-approve
cd ../

echo "# WARNING: Destroying RDS"

cd tf-rds
terraform init
terraform destroy -auto-approve
cd ../

echo "# WARNING: Destroying Network (VPC et al)"

cd tf-network
terraform init
terraform destroy -auto-approve
cd ../

