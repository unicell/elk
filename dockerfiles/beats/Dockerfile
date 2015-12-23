FROM golang:1.5-alpine
MAINTAINER Qiu Yu <unicell@gmail.com>

ENV GO15VENDOREXPERIMENT=1
RUN apk -U add git

RUN go get github.com/tools/godep
RUN go get github.com/elastic/beats
WORKDIR /go/src/github.com/elastic/beats/filebeat
RUN git checkout -b v1-0-1 v1.0.1
RUN godep get
RUN go build -o /opt/beats/bin/filebeat

ENV PATH /opt/beats/bin:$PATH
CMD ["filebeat"]
