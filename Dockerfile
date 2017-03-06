FROM alpine:edge
MAINTAINER Daniel Guerra
RUN apk --update --no-cache add go git musl-dev tor
ENV GOPATH=/root
RUN go get github.com/s-rah/onionscan
RUN go install github.com/s-rah/onionscan
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
COPY torrc /etc/tor/torrc
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
