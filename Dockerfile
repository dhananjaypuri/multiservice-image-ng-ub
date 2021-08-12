FROM ubuntu:bionic
LABEL Name="Dhananjay Puri"
LABEL ImgName="Ubng"
RUN apt-get update -y && apt install vim bash net-tools openssh-server nginx -y
COPY script.sh /root/script.sh
RUN chmod +x /root/script.sh
EXPOSE 22 80
RUN bash /root/script.sh
RUN apt-get install python supervisor -y
COPY index.html /usr/share/nginx/html/
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["supervisord"] 
