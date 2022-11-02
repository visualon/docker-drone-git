#!/bin/bash

set -e

check_semver "${TOOL_VERSION}"

if [[ ! "${MAJOR}" || ! "${MINOR}" || ! "${PATCH}" ]]; then
  echo Invalid version: "${TOOL_VERSION}"
  exit 1
fi

URL=https://github.com/drone/drone-git/archive/refs/tags/v${TOOL_VERSION}.tar.gz
TARGET=/tmp/drone-git.tgz


curl -sL "$URL" -o ${TARGET}
tar -C /tmp -xzf ${TARGET}

cp /tmp/drone-git-"${TOOL_VERSION}"/posix/clone* /usr/local/bin/

ln -sf /bin/bash /bin/sh
git config --system init.defaultBranch main
