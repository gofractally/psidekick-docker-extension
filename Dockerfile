FROM alpine

LABEL org.opencontainers.image.title="Psidekick" \
    org.opencontainers.image.description="Manages running a dockerized psinode. See about.psibase.io for more information." \
    org.opencontainers.image.vendor="Fractally LLC" \
    com.docker.desktop.extension.api.version="0.3.0" \
    com.docker.extension.categories="Database,Utility tools" \
    com.docker.extension.screenshots="" \
    com.docker.desktop.extension.icon="" \
    com.docker.extension.detailed-description="<h2>Psidekick</h2><p>Psidekick is a Docker Desktop extension that is used to run an instance of Psinode. Psinode is the client software for running a node on a Psibase blockchain.</p><p>This tool simplifies the process of deploying a node, and can be used to test out services/front-ends in a local deployment before pushing products to a live chain.</p>" \
    com.docker.extension.publisher-url="https://github.com/gofractally/" \
    com.docker.extension.additional-urls="about.psibase.io" \
    com.docker.extension.changelog="<p>Extension changelog<ul><li>Updated docker image location to ghcr</li><li>Added logo & details to extension metadata</li></ul></p>"

COPY metadata.json .
COPY logo-psibase.svg .
COPY ui ./ui
COPY docker-compose.yaml .
