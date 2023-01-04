#examples
ansible --version
scp -i <pem file> <pem file> ec2-user@<public DNS name of Control Node>:/home/ec2-user
ansible all -m ping -o
ansible node1 -m setup
ansible-playbook facts.yml
ansible-vault create secret.yml
ansible-playbook create-user.yml
ansible-playbook --ask-vault-pass create-user.yml
ansible all -b -m shell -a "tail -5 /etc/shadow"
ansible all -m shell -a "tail -5 /etc/passwd"

### Working with dynamic inventory
sudo yum install pip
pip install --user boto3 botocore
nano inventory_aws_ec2.yml
ansible-inventory -i inventory_aws_ec2.yml --graph
ansible-playbook user.yml -i inventory_aws_ec2.yml