# The Scenario
# A colleague was the unfortunate victim of a scam email, and their network account was compromised. Shortly after we finished helping them pack up their desk, our boss gave us the assignment to promote system security by deploying a hardened sudoers file. We need to create an Ansible template of the sudoers file.

# We also need to create an accompanying playbook in /home/ansible/security.yml that will deploy this template to all servers in the default inventory.

# Important notes:
# Ansible has been installed on the control node.
# The user ansible has been already created on all servers with the appropriate shared keys for access to the necessary servers from the control node. It has the same password as cloud_user.
# All necessary Ansible inventories have already been created.
# Logging In
# Log into the control node (control1) as the ansible user, using login credentials on the hands-on lab overview page.

# Create a Template sudoers File
[ansible@control1]$ vim /home/ansible/hardened.j2
#Now that we're in Vim, we'll put these contents in the file:

%sysops {{ ansible_default_ipv4.address }} = (ALL) ALL
Host_Alias WEBSERVERS = {{ groups['web']|join(' ') }}
Host_Alias DBSERVERS = {{ groups['database']|join(' ') }}
%httpd WEBSERVERS = /bin/su - webuser
%dba DBSERVERS = /bin/su - dbuser
#Create a Playbook
[ansible@control1]$ vim /home/ansible/security.yml
#The security.yml file should look like this:

---
- hosts: all
  become: yes
  tasks:
  - name: deploy sudo template
    template:
      src: /home/ansible/hardened.j2
      dest: /etc/sudoers.d/hardened
      validate: /sbin/visudo -cf %s
#Use the validate parameter to run the visudo command with the -cf flag to check the syntax of the sudoers file before saving it. If the visudo command returns an error, the task will fail.      
#Run the Playbook
[ansible@control1]$ ansible-playbook /home/ansible/security.yml
#The output will show that everything deployed fine, but we can check locally to make sure. Let's become root (with sudo su -) and then read our file:

[ansible@control1]$ sudo cat /etc/sudoers.d/hardened