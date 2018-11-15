FROM python:3-alpine3.8
LABEL maintainer "Titouan Condé <hi+docker@titouan.co>"
LABEL org.label-schema.name="splatnet2statink"
LABEL org.label-schema.vcs-url="https://code.titouan.co/titouan/docker-splatnet2statink"

ARG S2S_VERSION=master

ENV UID="991" \
    GID="991"

RUN apk add --no-cache build-base git jpeg-dev runit tini zlib-dev \
    && git clone --depth 1 --branch $S2S_VERSION https://github.com/frozenpandaman/splatnet2statink.git /splatnet2statink \
    && cd /splatnet2statink \
    && pip install -r requirements.txt \
    && apk del build-base git

COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

WORKDIR /splatnet2statink
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/start.sh"]
