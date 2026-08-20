FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/wps-office"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bsdextrautils libcups2t64 libfontconfig1 libfreetype6 libglu1-mesa \
    libsm6 libxext6 libxrender1 xdg-utils && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/wps-office.png
COPY wps-office.desktop /usr/share/applications/wps-office.desktop
