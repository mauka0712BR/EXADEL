Task5  
allow ssh connect using password and root loging on each host:  
vi /etc/ssh/sshd_config  
  
1. install ansible  
  Commands:  
      &nbsp;&nbsp;# dnf update -y   
     &nbsp;&nbsp;# dnf install ansible -y  
  Create ansible project directory:  
     &nbsp;&nbsp;# mkdir /opt/ansible  
      &nbsp;&nbsp;# cd /opt/ansible  
  create file with hosts:    
     &nbsp;&nbsp;#  echo "h1 ansible_user=root" >> /opt/ansible/hosts  
    &nbsp;&nbsp;#   echo "h2 ansible_user=root" >> /opt/ansible/hosts  
2. Ping mashines with ansible:  
      $ ansible -i hosts -m ping all  
       &nbsp;&nbsp;  
    result:  
     &nbsp;&nbsp;  
     &nbsp;&nbsp;![Alt text](/Task5/screenshots/ansible_ping.jpg?raw=true "Title")  
3. Write a playbook for installing Docker on two machines and run it  
 Command:  
 &nbsp;&nbsp;  # ansible-playbook -i hosts docker.yaml -vv    
 result:   
     &nbsp;&nbsp;    
     &nbsp;&nbsp;![Alt text](/Task5/screenshots/docker_install.jpg?raw=true "Title")   
&nbsp;&nbsp;  
EXTRA  
&nbsp;&nbsp;  
&nbsp;&nbsp; Setup dynamic inventory:   
&nbsp;&nbsp; 1. Install python3:  
&nbsp;&nbsp; # dnf install python3 python3-pip -y  
&nbsp;&nbsp; 2. install boto3 library:  
&nbsp;&nbsp; # pip3 install boto3  
&nbsp;&nbsp; 3. Create AWS config file:  
&nbsp;&nbsp; # mkdir -p /opt/ansible/inventory  
&nbsp;&nbsp; # nano aws_ec2.yaml  
&nbsp;&nbsp;![Alt text](/Task5/screenshots/aws_ec2_config.jpg?raw=true "Title")   
&nbsp;&nbsp; 4. enable aws_ec2 plugin and set default inventory direcrory in /etc/ansible/ansible.cfg  
&nbsp;&nbsp;![Alt text](/Task5/screenshots/ansible_cfg_1.jpg?raw=true "Title")  
&nbsp;&nbsp;![Alt text](/Task5/screenshots/ansible_cfg_2.jpg?raw=true "Title")  
&nbsp;&nbsp; 5. list dynamic inventory groups: 
&nbsp;&nbsp;  
&nbsp;&nbsp; # ansible-inventory --graph  
&nbsp;&nbsp;&nbsp;&nbsp;  
&nbsp;&nbsp;![Alt text](/Task5/screenshots/list_groups.jpg?raw=true "Title")
