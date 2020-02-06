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
if [[ $("${GUCCI_BIN}" -v) == *"${VERSION}" ]]; then
  echo "PASS"
else
  echo "FAIL"
  EXIT=1
fi

exit $EXIT
