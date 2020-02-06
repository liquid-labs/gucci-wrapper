#!/usr/bin/env bash

source settings.sh

if [[ $1 == '--force' ]] || ! [[ -f "${GUCCI_BIN}" ]]; then
  mkdir -p "$(dirname "${GUCCI_BIN}")"
  curl -L https://github.com/noqcks/gucci/releases/download/${VERSION}/gucci-v${VERSION}-darwin-amd64 -o "${GUCCI_BIN}"
  chmod a+x "${GUCCI_BIN}"
fi
