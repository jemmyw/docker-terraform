FROM alpine:3.3
MAINTAINER Jeremy Wells <jemmyw@gmail.com>

RUN apk update && apk upgrade && apk add zip ca-certificates
ENV VERSION 0.7.3

ADD https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip /
RUN unzip /terraform_${VERSION}_linux_amd64.zip -d /usr/bin \
    && rm /*.zip \
    && mkdir /app

WORKDIR /app
ENTRYPOINT ["/usr/bin/terraform"]
