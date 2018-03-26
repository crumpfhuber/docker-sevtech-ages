FROM java:8-alpine
MAINTAINER Jacob Wiltse <kelwing@kelnet.org>

RUN mkdir -p /opt/ftb
WORKDIR /opt/ftb
RUN apk --no-cache add curl wget ca-certificates
RUN curl -L -o server.zip https://www.feed-the-beast.com/projects/ftb-beyond/files/2482845/download && unzip server.zip && rm -f server.zip
COPY ops.json server.properties ./
RUN sed -i 's/false/true/g' eula.txt
RUN sed -i 's/3072M/4096M/g' settings.sh

CMD ["sh", "ServerStart.sh"]
