FROM alpine
MAINTAINER rolf@jottacloud.com
RUN apk add --update coreutils && rm -rf /var/cache/apk/*
COPY ./every.sh /
ENTRYPOINT ["/every.sh"]
