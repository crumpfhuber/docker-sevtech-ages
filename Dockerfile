FROM java:8
MAINTAINER Jacob Wiltse <kelwing@kelnet.org>

RUN mkdir -p /opt/ftb/world
WORKDIR /opt/ftb
RUN apt-get install -y curl wget
RUN curl -L -o server.zip https://minecraft.curseforge.com/projects/sevtech-ages/files/2547513/download && unzip server.zip && rm -f server.zip
COPY ops.json server.properties ./
RUN sed -i 's/2048M/4096M/g' settings.sh
RUN /bin/bash Install.sh

CMD ["sh", "Start.sh"]
