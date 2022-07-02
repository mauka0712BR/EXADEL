Task5  
allow ssh connect using password and root loging on each host:  
vi /etc/ssh/sshd_config  
  
1. install ansible  
  Commands:  
   1. dnf update -y 
   2. dnf install ansible -y  
  Create ansible project directory:  
    mkdir /opt/ansible  
    cd /opt/ansible  
  create file with hosts  
    echo "h1 ansible_user=root" >> /opt/ansible/hosts  
    echo "h2 ansible_user=root" >> /opt/ansible/hosts  
2. Ping mashines with ansible:  
    ansible -i hosts -m ping all  
    
