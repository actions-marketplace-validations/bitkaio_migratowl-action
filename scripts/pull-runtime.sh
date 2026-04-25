#!/usr/bin/env bash
# Pulls the prebuilt Migratowl runtime image from GHCR and loads it
# into the kind cluster so sandbox pods can use it without an internet pull.

set -euo pipefail

MIGRATOWL_VERSION="${MIGRATOWL_VERSION:-latest}"
RUNTIME_IMAGE="ghcr.io/bitkaio/migratowl-runtime:${MIGRATOWL_VERSION}"

log() { echo "[migratowl/pull-runtime] $*"; }

log "Pulling ${RUNTIME_IMAGE}"
docker pull "${RUNTIME_IMAGE}"

log "Loading image into kind cluster"
kind load docker-image "${RUNTIME_IMAGE}" --name migratowl

# Expose the image tag so start-migratowl.sh and trigger-scan.sh can use it.
echo "MIGRATOWL_RUNTIME_IMAGE=${RUNTIME_IMAGE}" >> "$GITHUB_ENV"
log "Runtime image ready: ${RUNTIME_IMAGE}"
