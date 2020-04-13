FROM golang:alpine
COPY caddy.go /caddy/caddy.go
WORKDIR /caddy
RUN apk add --update-cache --no-cache git &&\
    export GO111MODULE=on &&\
    go mod init caddy &&\
    go get github.com/caddyserver/caddy@v1.0.4 &&\
    echo "replace github.com/h2non/gock => gopkg.in/h2non/gock.v1 v1.0.15" >> go.mod &&\
    go build

FROM alpine
WORKDIR /
COPY --from=0 /caddy/caddy /usr/local/bin/
RUN apk add --update ca-certificates
ENTRYPOINT ["/usr/local/bin/caddy"]
CMD ["-conf", "/root/.caddy/Caddyfile", "-email", "colachg@gmail.com", "-agree"]
