#!/bin/sh
if [ -f /run/secrets/github_token_password ]; then
  _raw=$(cat /run/secrets/github_token_password)
  export GITHUB_TOKEN="${_raw#GITHUB_TOKEN=}"
  unset _raw
fi
"$@"
exit_code=$?
if [ -n "${HOST_UID}" ] && [ -n "${HOST_GID}" ]; then
  chown -R "${HOST_UID}:${HOST_GID}" /app/dist
fi
exit $exit_code
