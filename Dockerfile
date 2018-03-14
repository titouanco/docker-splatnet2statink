FROM python:2-alpine3.7
LABEL maintainer "Titouan Condé <eownis+docker@titouan.co>"
LABEL org.label-schema.name="splatnet2statink"
LABEL org.label-schema.vcs-url="https://git.titouan.co/eownis/docker-splatnet2statink"

ARG S2S_VERSION=master

ENV UID="991" \
    GID="991"

RUN apk add --no-cache git runit tini \
    && pip install requests msgpack-python \
    && git clone --depth 1 --branch $S2S_VERSION https://github.com/frozenpandaman/splatnet2statink.git /splatnet2statink \
    && apk del git

COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

WORKDIR /splatnet2statink
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/start.sh"]
