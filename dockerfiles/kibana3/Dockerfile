FROM gliderlabs/alpine:3.1
MAINTAINER Qiu Yu <unicell@gmail.com>

RUN apk add --update curl tar py-twisted

ENV KIBANA_VERSION 3.1.2
ENV KIBANA_SHA1 a59ea4abb018a7ed22b3bc1c3bcc6944b7009dc4

RUN set -x \
        && curl -fSL "https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz" -o kibana.tar.gz \
        && echo "${KIBANA_SHA1}  kibana.tar.gz" | sha1sum -c - \
        && mkdir -p /opt/kibana \
        && tar -xz --strip-components=1 -C /opt/kibana -f kibana.tar.gz \
        && rm kibana.tar.gz

COPY config/config.js /opt/kibana/config.js
COPY start.sh /start.sh

EXPOSE 8080
CMD ["/start.sh"]
