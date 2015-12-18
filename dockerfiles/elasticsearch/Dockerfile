FROM elasticsearch:2.1
MAINTAINER Qiu Yu <unicell@gmail.com>

# RUN plugin install karmi/elasticsearch-paramedic
# RUN plugin install royrusso/elasticsearch-HQ

RUN mkdir /repo && chown elasticsearch:elasticsearch /repo
VOLUME ["/repo"]
COPY start.sh /start.sh

# triggered through /docker-entrypoint.sh in upstream image
CMD ["/start.sh"]
