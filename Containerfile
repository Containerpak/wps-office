FROM ubuntu:26.04 AS source

ADD --checksum=sha256:fe6326210f69d94efdbf2728914d293036be391b93a614f58cd0e1ff1d4923b3 https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11723/wps-office_11.1.0.11723.XA_amd64.deb /tmp/app.deb

FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/wps-office"

RUN --mount=type=bind,from=source,source=/tmp/app.deb,target=/run/app.deb \
    apt-get update && \
    apt-get install -y --no-install-recommends /run/app.deb && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/wps-office.png
COPY wps-office.desktop /usr/share/applications/wps-office.desktop
