FROM arm32v6/alpine:latest
COPY qemu-arm-static /usr/bin

RUN \
  mkdir -p /build && \
  wget \
    http://repo.feed.flightradar24.com/pool/raspberrypi-stable/f/fr24feed/fr24feed_1.0.23-8_armhf.deb \
    -O /build/fr24feed.deb && \
  apk add \
    --no-cache \
    binutils \
    bash && \
  cd /build && \
  ar x fr24feed.deb && \
  tar -xzf data.tar.gz && \
  cp usr/bin/fr24feed /usr/bin && \
  apk del --no-cache binutils && \
  rm -rf \
    /usr/bin/qemu-arm-static \
    /build

CMD ["fr24feed"]
