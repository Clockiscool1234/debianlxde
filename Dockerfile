FROM debian
LABEL maintainer="wiqowiqo15@gmail.com"


RUN apt-get update && \
    apt-get install lxde tigervnc-standalone-server \
    nano wget python3-websockify novnc -y

RUN mkdir /root/.vnc && \
    echo startlxde > /root/.vnc/xstartup
    export USER=root

RUN vncserver :1 -SecurityTypes None,TLSNone && \
    websockify -D --web=/usr/share/novnc/ --cert=/home/debian/novnc.pem 80 localhost:5901

EXPOSE 80
