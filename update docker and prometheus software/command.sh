#First create a new EC2 instance with Ubuntu 20.04 instance image

sudo yum install git

ansible-galaxy install -r role_requirements.yml

ansible-galaxy init /home/ec2-user/ansible/roles/common

#When you get ntp error, go and customize common role from ansible/roles/common/tasks/main.yml

```yml
---
# tasks file for on the control node /home/ec2-user/ansible/roles/common/tasks/main.yml:
#######
- name: Common Tasks
  debug:
    msg: Common Task Triggered

- name: Fix dpkg
  command: dpkg --configure -a

- name: Update apt
  apt:
    upgrade: dist
    update_cache: yes

- name: Install packages
  apt:
    name: "{{ item }}"
    state: present
  with_items:
    - ntp
#####

ansible-playbook play-book.yml
