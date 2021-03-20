ARG INPUT_ALPINE_VERSION=3
FROM alpine:${INPUT_ALPINE_VERSION}

RUN export

ARG INPUT_YC_VERSION=0.78.0
ARG INPUT_YC_DATACENTER

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
    && chmod +x ${YC_BIN} /entrypoint.sh &&\
    export

#ENTRYPOINT ["/entrypoint.sh"]
