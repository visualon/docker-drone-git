
# renovate: datasource=github-releases depName=drone-git lookupName=drone/drone-git
ARG DRONE_GIT_VERSION=v1.2.1


FROM ghcr.io/containerbase/buildpack:3.17.4@sha256:dbcfcca7de096140389a21695976c0056b5adee5e494bfb6b537dee5c7384080 as buildpack

FROM ubuntu:20.04@sha256:fd92c36d3cb9b1d027c4d2a72c6bf0125da82425fc2ca37c414d4f010180dc19

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
RUN install-tool git v2.36.1

COPY src/ /

ARG DRONE_GIT_VERSION
LABEL org.opencontainers.image.version="${DRONE_GIT_VERSION}"

RUN install-tool drone-git
