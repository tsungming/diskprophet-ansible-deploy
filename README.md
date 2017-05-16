# diskprophet-ansible-deploy

[Ansible](https://www.ansible.com/) for creating a diskprophet cluster running on ubuntu 16.04 
in an [AWS Virtual Private Cloud VPC](https://aws.amazon.com/vpc/).
The stack can be deployed using the following command:

```bash
# setup
$ ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts diskprophet_deploy.yml

```

## Roles

prepare_aws_ec2: 
- EC2 Key Pair creation
- AWS VPC Public subnets
- Diskprophet-server ec2 instance creation  
- Diskprophet-master ec2 instance creation
- Diskprophet-agent ec2 instance creation

server:
- Influxdb, Grafana, Java and Spark installation

master:
- Influxdb and Java installation
- Diskprophet-server connection

agent:
- Telegraf, Java and Smartmontools installation
- Diskprophet-master connection

