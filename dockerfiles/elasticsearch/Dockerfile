FROM elasticsearch:1.7
MAINTAINER Qiu Yu <unicell@gmail.com>

RUN plugin -i karmi/elasticsearch-paramedic
RUN plugin -i royrusso/elasticsearch-HQ

RUN mkdir /repo && chown elasticsearch:elasticsearch /repo
VOLUME ["/repo"]
COPY start.sh /start.sh

# triggered through /docker-entrypoint.sh in upstream image
CMD ["/start.sh"]
