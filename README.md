# 🐳 eownis/docker-splatnet2statink

[![build status](https://cd.code.titouan.co/api/badges/titouan/docker-splatnet2statink/status.svg)](https://cd.code.titouan.co/titouan/docker-splatnet2statink)

[![](https://images.microbadger.com/badges/version/eownis/splatnet2statink.svg)](https://microbadger.com/images/eownis/splatnet2statink "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/eownis/splatnet2statink.svg)](https://microbadger.com/images/eownis/splatnet2statink "Get your own image badge on microbadger.com")

[splatnet2statink](https://github.com/frozenpandaman/splatnet2statink). Built by [Drone](https://cd.code.titouan.co/titouan/docker-splatnet2statink) and pushed to [Docker Hub](https://hub.docker.com/r/eownis/splatnet2statink/).

## Usage

`docker-compose.yml` :
```yaml
...
  splatnet2statink:
    image: eownis/splatnet2statink:latest
    container_name: splatnet2statink
    restart: always
    environment:
      - IKSM=secret
      - STATINK_API_KEY=secret
      - USER_LANG=en-GB
...
```
