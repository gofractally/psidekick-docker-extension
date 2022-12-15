FROM alpine

LABEL org.opencontainers.image.title="Psidekick" \
    org.opencontainers.image.description="Manages running a dockerized psinode. See about.psibase.io for more information." \
    org.opencontainers.image.vendor="Fractally LLC" \
    com.docker.desktop.extension.api.version="0.3.0" \
    com.docker.extension.categories="Database,Utility tools" \
    com.docker.extension.screenshots="" \
    com.docker.desktop.extension.icon="" \
    com.docker.extension.detailed-description="" \
    com.docker.extension.publisher-url="" \
    com.docker.extension.additional-urls="" \
    com.docker.extension.changelog=""

COPY metadata.json .
COPY logo-psibase.svg .
COPY ui ./ui
COPY docker-compose.yaml .
