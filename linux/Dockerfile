
# renovate: datasource=github-releases depName=drone-git lookupName=drone/drone-git
ARG DRONE_GIT_VERSION=v1.2.1


FROM ghcr.io/containerbase/buildpack:5.2.8@sha256:f363a9b95cc7d6c16642c050926a322e75873a5218e8b9c709ec7f43c6de8532 as buildpack

FROM ubuntu:22.04@sha256:27cb6e6ccef575a4698b66f5de06c7ecd61589132d5a91d098f7f3f9285415a9

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
RUN install-tool git v2.39.0

COPY src/ /

ARG DRONE_GIT_VERSION
LABEL org.opencontainers.image.version="${DRONE_GIT_VERSION}"

RUN install-tool drone-git
