ARG INPUT_ALPINE_VERSION=3
FROM alpine:${INPUT_ALPINE_VERSION}

RUN export

ARG INPUT_YC_VERSION=0.73.0
ARG INPUT_YC_DATACENTER="ru-central1-b"
ARG INPUT_YC_CONF="./config/providers/yc/config.tmpl"
ARG INPUT_YC_BIN=/bin/yc
ARG INPUT_YC_TOKEN="AgAEA7qixz2HAATuwVGQnftqPEsbj3PyMn7iwe0"
ARG INPUT_YC_CLOUD_ID="b1g1m32tf7mi6325098c"
ARG INPUT_YC_FOLDER_ID="b1gaietmb907aq33e1ji"

ARG WORKDIR="/core"
WORKDIR ${WORKDIR}

ENV YC_LINK=https://storage.yandexcloud.net/yandexcloud-yc/release/${INPUT_YC_VERSION}/linux/amd64/yc
ENV YC_BIN=$INPUT_YC_BIN
ENV YC_CONF=$INPUT_YC_CONF
ENV YC_CLOUD_ID=$INPUT_YC_CLOUD_ID
ENV YC_FOLDER_ID=$INPUT_YC_FOLDER_ID
ENV YC_TOKEN=$INPUT_YC_TOKEN
ENV YC_DATACENTER=$INPUT_YC_DATACENTER

COPY entrypoint.sh /entrypoint.sh
COPY ${YC_CONF} ${HOME}/.config/yandex-cloud/config.yml

RUN wget -q ${YC_LINK} -O ${YC_BIN}\
    && chmod +x ${YC_BIN} /entrypoint.sh
    
#ENTRYPOINT ["/entrypoint.sh"]
