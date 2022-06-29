#install docker from script  
chmod a+x install.sh  
./install.sh  
  
#run docker container  
docker create --name nginx_base -p 80:80 nginx:alpine  
#create html page with text  
echo "<html>   
<head>
<title>mauka0712 2022</title>  
</head>  
<body>  
<h1>mauka0712 2022</h1>  
</body>" >> index.html  
#copy page to docker container  
docker cp index.html nginx_base:/usr/share/nginx/html/index.html  
#define container ID  
docker ps -a  
#start container  
docker start "CONTAINER ID"  
  
#create docker file  
mkdir /opt/task4/  
mkdir /opt/task4  
cd /opt/task4/p3  
#config docker image  
echo "FROM ubuntu:18.04  
RUN apt-get update -y  
RUN apt-get install apache2 -y  
EXPOSE 80  
CMD apachectl -D FOREGROUND" >> /opt/task4/dockerfile  
cd /opt/task4/  
#build docker image  
docker build -t ubuntu:web_p3.1.1 .  
#run docker image with html page, insert environment from file  
docker run --env-file .env -d -p 1111:80 ubuntu:web  
#check inserted invironment  
docker exec f8003adc396a env  
  
#login to dockerhub  
docker login --username=mauka0712  
#add tag to image  
docker tag [IMAGE_ID] mauka0712/task4:web_ubuntu  
#upload image to account  
docker push mauka0712/task4:web_ubuntu  
docker save mauka0712/task4 > web_task4.tar  



