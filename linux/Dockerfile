
# renovate: datasource=github-releases depName=drone-git lookupName=drone/drone-git
ARG DRONE_GIT_VERSION=v1.2.1


FROM ghcr.io/containerbase/buildpack:2.9.0@sha256:136a2de8362f9cb6755485454bbf7b265bd4c56b6d27f96f3c48e56db93d9b95 as buildpack

FROM ubuntu:20.04@sha256:b5a61709a9a44284d88fb12e5c48db0409cfad5b69d4ff8224077c57302df9cf

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
RUN install-tool git v2.34.1

COPY src/ /

ARG DRONE_GIT_VERSION
LABEL org.opencontainers.image.version="${DRONE_GIT_VERSION}"

RUN install-tool drone-git
