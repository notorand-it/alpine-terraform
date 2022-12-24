FROM alpine:latest
ARG TF_VERSION
RUN apk -U upgrade && apk add binutils &&\
    wget -qq -O - "https://releases.hashicorp.com/terraform/${TF_VERSION:-1.0.2}/terraform_${TF_VERSION:-1.0.2}_linux_amd64.zip" | unzip -q -d /usr/bin - &&\
    chmod +x /usr/bin/terraform &&\
    strip /usr/bin/terraform &&\
    apk del binutils
#EOF