#!/usr/bin/env bash

source settings.sh

if [[ $1 == '--force' ]] || ! [[ -f "${GUCCI_BIN}" ]]; then
  PLATFORM="$(uname -s)"
  if [[ "${PLATFORM}" == 'Darwin' ]]; then
    PLATFORM='darwin'
  else
    echo "[INFO] Using generic 'linux' platform for '${PLATFORM}'"
    PLATFORM='linux'
  fi
  mkdir -p "$(dirname "${GUCCI_BIN}")"
  curl -L https://github.com/${REPO}/releases/download/${VERSION}/gucci-v${VERSION}-${PLATFORM}-amd64 -o "${GUCCI_BIN}"
  chmod a+x "${GUCCI_BIN}"
fi
