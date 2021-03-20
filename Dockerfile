FROM alpine:latest
RUN apk add --update curl bash &&\
    id &&\
    mkdir -m 0766 -p /root/.config/yandex-cloud/ &&\
    curl -s https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash -s -- -i /

COPY config/providers/yc /github/workflow/yc
