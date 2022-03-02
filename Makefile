# See repo README for more details on Makefile targets

.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[95m%-30s\033[0m %s\n", $$1, $$2}'


# Installation
install: ## Use Poetry to install dependencies to use this repo locally
	source helpers/setup.sh && install

install-cloudshell: ## Use Poetry and Yum to install dependencies to use this repo in AWS CloudShell
	source helpers/setup.sh && aws_cloudshell_install
	make install


# Demo infrastructure support per webinar
101-infra-provision: ## Use Terraform to provision 101 demo infrastructure
	source helpers/setup.sh && demo_infra_provision c7n-101

101-infra-destroy: ## Use Terraform and c7n mugc to destroy 101 demo infrastructure
	source helpers/setup.sh && demo_infra_destroy c7n-101

workshop-infra-provision: ## Use Terraform to provision workshop demo infrastructure
	source helpers/setup.sh && demo_infra_provision c7n-workshop

workshop-infra-destroy: ## Use Terraform and c7n mugc to destroy workshop demo infrastructure
	source helpers/setup.sh && demo_infra_destroy c7n-workshop


# Cloud Custodian command help per webinar
101-custodian-commands: ## Print out the Cloud Custodian commands to run policies
	cat resources/example-policies/c7n-101/c7n-101-commands.txt

workshop-custodian-commands: ## Print out the Cloud Custodian commands to run the workshop policies
	cat resources/example-policies/c7n-workshop/c7n-workshop-commands.txt


#AWS CLI operations
stop-instance: ## Specify an EC2 instance to stop
	source helpers/setup.sh && stop_instance

start-instance: ## Specify an EC2 instance to start
	source helpers/setup.sh && stop_instance

describe-all-resources: ## Specify a tag to view all resources for -- displays account number so use with discretion
	source helpers/setup.sh && describe_all_resources

describe-ec2s: ## Specify a tag to view all EC2 instances for
	source helpers/setup.sh && describe_ec2s	

describe-lambdas: ## List all Lamdbda functions with names prefixed with "custodian"
	source helpers/setup.sh && describe_lambdas

describe-roles: ## Specify a role to view
	source helpers/setup.sh && describe_roles

describe-sgs: ## Specify a tag to view all security groups for
	source helpers/setup.sh && describe_sgs

describe-sqs: ## Specify a queue to view details of
	source helpers/setup.sh && describe_sqs

describe-tags: ## Specify an EC2 to view tags for
	source helpers/setup.sh && describe_tags