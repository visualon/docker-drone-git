
# renovate: datasource=github-releases depName=drone-git lookupName=drone/drone-git
ARG DRONE_GIT_VERSION=v1.2.1

FROM ghcr.io/containerbase/buildpack:1.19.7@sha256:2a09856aa60525450d1d50b8575c73e88fbbacb95f242421f292dc87487cce28


LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
    org.opencontainers.image.authors="Michael Kriese <michael.kriese@visualon.de>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/visualon/docker-drone-git" \
    org.opencontainers.image.url="https://github.com/visualon/docker-drone-git"

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/usr/local/bin/clone"]

ARG DRONE_GIT_VERSION
LABEL org.opencontainers.image.version="${DRONE_GIT_VERSION}"

# required to run scripts via bash instead of dash
RUN ln -sf /bin/bash /bin/sh

COPY src/ /

ARG DRONE_GIT_VERSION
RUN install-tool drone-git
