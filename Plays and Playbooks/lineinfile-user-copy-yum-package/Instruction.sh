# Introduction
# Playbooks are the heart of Ansible. They provide a means of executing numerous tasks across any number of systems. This exercise sets you on the path to Ansible mastery by allowing you to craft and execute an Ansible playbook.

# Your supervisor has asked you to find a way to automate and audit basic system configuration for new servers in your environment. Given that Ansible is already configured at a basic level in your environment, the simplest solution would be to just write a playbook for bootstrapping your new hosts. Create a playbook called /home/ansible/bootstrap.yml to fulfill the following boot strap requirements:

# All servers:

# Edit /etc/hosts to include the following entry:

# ansible.xyzcorp.com  169.168.0.1
# Install elinks

# Create the user xyzcorp_audit

# Copy the files /home/ansible/motd and /home/ansible/issue to /etc/

# Network servers:

# Install nmap-ncat
# Create the user xyzcorp_network
# SysAdmin servers:

# Copy /home/ansible/scripts.tgz from the control node to /mnt/storage