
# renovate: datasource=github-releases depName=drone-git lookupName=drone/drone-git
ARG DRONE_GIT_VERSION=v1.2.1


FROM ghcr.io/containerbase/buildpack:3.16.1@sha256:7af7663c01f9ade2468ef577bdcf9c7136b36fa2425990141d77d1c4d495b4c5 as buildpack

FROM ubuntu:20.04@sha256:47f14534bda344d9fe6ffd6effb95eefe579f4be0d508b7445cf77f61a0e5724

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
