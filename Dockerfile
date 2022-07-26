FROM alpine:3.16 as builder

ARG VERSION=1.0.1
RUN apk add curl
RUN curl https://github.com/ovh/venom/releases/download/v$VERSION/venom.linux-amd64 -L -o /usr/local/bin/venom && chmod +x /usr/local/bin/venom


FROM busybox:1.34

RUN addgroup -g 1001 venom && adduser -D -u 1001 -G venom venom
USER venom
WORKDIR /venom

COPY --from=builder /usr/local/bin/venom /usr/local/bin/venom
ENTRYPOINT ["/usr/local/bin/venom"]
CMD ["help"]

