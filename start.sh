#!/bin/sh

addgroup -g ${GID} s2s
adduser -h /data -s /bin/sh -D -G s2s -u ${UID} s2s

cat > /splatnet2statink/config.txt <<__EOF__
{
    "api_key": "${STATINK_API_KEY}",
    "cookie": "${IKSM}",
    "user_lang": "${USER_LANG}"
}
__EOF__

chown -R s2s:s2s /splatnet2statink

chpst -u s2s -U s2s -- sh -c 'python /splatnet2statink/splatnet2statink.py -M 300 -r'
