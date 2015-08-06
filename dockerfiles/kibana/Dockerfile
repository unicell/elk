FROM kibana:4
MAINTAINER Qiu Yu <unicell@gmail.com>

RUN apt-get update && apt-get install -y netcat

COPY config/kibana.yml /opt/kibana/config/kibana.yml
COPY start.sh /start.sh

# triggered through /docker-entrypoint.sh in upstream image
CMD ["/start.sh"]
