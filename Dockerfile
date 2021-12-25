FROM alpine:edge as BUILD
RUN apk add --no-cache socat
ENTRYPOINT [ "socat" ]
