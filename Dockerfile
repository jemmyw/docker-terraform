FROM alpine:3.3
MAINTAINER Jeremy Wells <jemmyw@gmail.com>

RUN apk update && apk upgrade && apk add zip
ENV VERSION 0.6.9

ADD https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip /tmp
RUN unzip /tmp/terraform_${VERSION}_linux_amd64.zip -d /usr/bin \
    && rm /tmp/*.zip \
    && mkdir /app

WORKDIR /app
ENTRYPOINT ["/usr/bin/terraform"]
