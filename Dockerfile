FROM java:8
MAINTAINER Jacob Wiltse <kelwing@kelnet.org>

RUN mkdir -p /opt/ftb/world
WORKDIR /opt/ftb
RUN apt-get install -y curl wget unzip
RUN curl -L -o server.zip https://media.forgecdn.net/files/3126/384/SevTech_Ages_of_the_Sky_3_2_1_Beta_1.zip && unzip server.zip && rm -f server.zip
COPY ops.json server.properties ./
RUN sed -i 's/2048M/4096M/g' settings.sh
RUN /bin/bash Install.sh

CMD ["sh", "Start.sh"]
