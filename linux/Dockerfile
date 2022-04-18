
# renovate: datasource=github-releases depName=drone-git lookupName=drone/drone-git
ARG DRONE_GIT_VERSION=v1.2.1


FROM ghcr.io/containerbase/buildpack:3.14.6@sha256:271823208aa91c7d1a7b897035b79ad8b374c4db20ab522607ae144d0495a27f as buildpack

FROM ubuntu:20.04@sha256:9101220a875cee98b016668342c489ff0674f247f6ca20dfc91b91c0f28581ae

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
    org.opencontainers.image.authors="Michael Kriese <michael.kriese@visualon.de>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/visualon/docker-drone-git" \
    org.opencontainers.image.url="https://github.com/visualon/docker-drone-git"

ARG USER_NAME=drone

ENV BASH_ENV=/usr/local/etc/env

ENTRYPOINT ["docker-entrypoint.sh", "/usr/local/bin/clone"]

COPY --from=buildpack /usr/local/bin/ /usr/local/bin/
COPY --from=buildpack /usr/local/buildpack/ /usr/local/buildpack/
RUN install-buildpack

# renovate: datasource=github-tags lookupName=git/git
RUN install-tool git v2.36.0

COPY src/ /

ARG DRONE_GIT_VERSION
LABEL org.opencontainers.image.version="${DRONE_GIT_VERSION}"

RUN install-tool drone-git
