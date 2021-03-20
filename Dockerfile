FROM alpine:latest AS runner

WORKDIR /core

RUN apk add --update curl bash &&\
    curl -s https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash -s -- -i / &&\
