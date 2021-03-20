FROM alpine:latest
RUN apk add --update curl bash &&\
   curl -s https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash -s -- -i / &&\
   echo "OK"

COPY config/providers/yc /root/.config/yandex-cloud
