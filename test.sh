#!/usr/bin/env bash

source settings.sh

EXIT=0

echo -n "Test simple template: "
if [[ $(echo 'Gucci test {{ .STATUS }}' | "${GUCCI_BIN}" -s STATUS='good') == 'Gucci test good' ]]; then
  echo "PASS"
else
  echo "FAIL"
  EXIT=1
fi

echo -n "Version check: "
BIN_VERSION=$("${GUCCI_BIN}" -v)
if [[ "${BIN_VERSION}" == *"${VERSION}" ]] || [[ -n "${AD_HOC_RELEASE}" ]]; then
  echo "PASS"
else
  echo "FAIL; expected version '${VERSION}', but got '${BIN_VERSION}'"
  EXIT=1
fi

exit $EXIT
