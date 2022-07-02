Task5  
allow ssh connect using password and root loging on each host:  
vi /etc/ssh/sshd_config  
  
1. install ansible  
  Commands:  
      &nbsp;&nbsp;dnf update -y   
     &nbsp;&nbsp; dnf install ansible -y  
  Create ansible project directory:  
     &nbsp;&nbsp;  mkdir /opt/ansible  
      &nbsp;&nbsp; cd /opt/ansible  
  create file with hosts:    
     &nbsp;&nbsp;  echo "h1 ansible_user=root" >> /opt/ansible/hosts  
    &nbsp;&nbsp;   echo "h2 ansible_user=root" >> /opt/ansible/hosts  
2. Ping mashines with ansible:  
      ansible -i hosts -m ping all  
    result:  
     &nbsp;&nbsp;![Alt text](/Task5/screenshots/ansible_ping.jpg?raw=true "Title")
