FROM alpine:latest
ARG TF_VERSION
RUN apk -U upgrade && apk add binutils-x86_64 &&\
    wget -qq -O - "https://releases.hashicorp.com/terraform/${TF_VERSION:-1.0.2}/terraform_${TF_VERSION:-1.0.2}_linux_amd64.zip" | unzip -q -d /usr/bin - &&\
    chmod -R +x /usr/bin/terraform &&\
    /usr/x86_64-alpine-linux-musl/bin/strip /usr/bin/terraform &&\
    apk del binutils-x86_64
#EOF