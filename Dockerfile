FROM alpine:latest
RUN apk add --update curl bash &&\
    id &&\
    mkdir -m 0766 -p /root/.config/yandex-cloud/ &&\
    wget https://storage.yandexcloud.net/yandexcloud-yc/release/0.73.0/linux/amd64/yc

COPY config/providers/yc /github/workflow/yc
