FROM gliderlabs/alpine:3.1
MAINTAINER Qiu Yu <unicell@gmail.com>

ENV GOPATH /go
RUN apk-install go git

RUN go get github.com/elastic/logstash-forwarder
WORKDIR /go/src/github.com/elastic/logstash-forwarder
RUN git checkout -b v0-4-0 v0.4.0
RUN go build -o /opt/logstash/bin/logstash-forwarder

ENV PATH /opt/logstash/bin:$PATH
CMD ["logstash-forwarder"]
