FROM debian:11
RUN apt update -y > /dev/null 2>&1 && apt upgrade -y > /dev/null 2>&1 && apt install locales -y \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN apt install ssh wget unzip -y > /dev/null 2>&1
RUN wget -O ngrok.zip https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip ngrok.zip
RUN echo "./ngrok config add-authtoken 2Op4kZ95lAFNdUF9ruBLUa9QAFk_2ooexvxCfNV7CnH1x1RJ8 &&" >>/kaal.sh
RUN echo "./ngrok tcp 22 &>/dev/null &" >>/kaal.sh
RUN mkdir /run/sshd
RUN echo '/usr/sbin/sshd -D' >>/kaal.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo root:kaal|chpasswd
RUN service ssh start
RUN chmod 755 /kaal.sh
EXPOSE 80 8888 8080 443 5130 5131 5132 5133 5134 5135 3306
CMD  /kaal.sh
CMD ["/bin/bash", "/start.sh"]
