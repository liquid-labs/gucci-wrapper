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
  URL="https://github.com/${REPO}/releases/download/${VERSION}/gucci-v${VERSION}-${PLATFORM}-amd64"
  curl -v -L ${URL} --output "${GUCCI_BIN}" 2> gucci-download.log \
    || { echo "There was a problem downloading gucci from: ${URL}"; exit 1; }
  chmod a+x "${GUCCI_BIN}"
fi
