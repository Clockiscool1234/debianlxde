FROM debian
LABEL maintainer="wiqowiqo15@gmail.com"

ENV USER=root
ENV HOME=/root

RUN apt-get update && \
    apt-get install lxde-core tigervnc-standalone-server \
    nano wget python3-websockify novnc firefox-esr -y

RUN mkdir /root/.vnc && \
    echo startlxde > /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

RUN vncserver :1 -SecurityTypes None,TLSNone && \
    websockify -D --web=/usr/share/novnc/ 8080 localhost:5901

EXPOSE 8080
