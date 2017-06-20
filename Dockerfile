FROM alpine:3.6
MAINTAINER Jeremy Wells <jemmyw@gmail.com>

RUN apk update && apk upgrade && apk add zip ca-certificates curl git go make musl-dev libc-dev g++ bash fakeroot
ENV VERSION 0.10.0

RUN mkdir -p /opt/go/bin; mkdir -p /opt/go/src
ENV GOPATH /opt/go
ENV GOBIN /opt/go/bin
ENV PATH $GOBIN:$PATH

RUN go get -u github.com/hashicorp/terraform

RUN cd /opt/go/src/github.com/hashicorp/terraform \
  && XC_OS=linux XC_ARCH=amd64 make bin

RUN go get -u github.com/terraform-providers/terraform-provider-logentries
RUN go get -u github.com/terraform-providers/terraform-provider-null
RUN go get -u github.com/terraform-providers/terraform-provider-aws
RUN cd /opt/go/src/github.com/terraform-providers \
  && for m in `ls`; do echo $m; cd $m && make build && cd ..; done

RUN terraform -version
RUN mkdir /app
WORKDIR /app
ENTRYPOINT ["$GOBIN/terraform"]
