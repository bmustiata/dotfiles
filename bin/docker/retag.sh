#!/bin/bash
set -e

MANIFEST_LOCATION=$(tempfile)
PUSHLOG_FILE=$(tempfile)
CONTENT_TYPE="application/vnd.docker.distribution.manifest.v2+json"

OLD_TAG="$1"
NEW_TAG="$2"

registry() {
  echo $1 | perl -pe 's|^(.+?)/.*$|\1|'
}

image() {
  echo $1 | perl -pe 's|^.+?/(.+?)(\:.*)?$|\1|'
}

tag() {
  echo $1 | perl -pe 's|^.+?/(.+?)(\:(.*))?$|\3|'
}

OLD_REGISTRY="$(registry "$OLD_TAG")"
OLD_IMAGE="$(image "$OLD_TAG")"
OLD_TAG="$(tag "$OLD_TAG")"

NEW_REGISTRY="$(registry "$NEW_TAG")"
NEW_IMAGE="$(image "$NEW_TAG")"
NEW_TAG="$(tag "$NEW_TAG")"

curl -u "$USERPASS" -H "Accept: $CONTENT_TYPE" "https://$OLD_REGISTRY/v2/$OLD_IMAGE/manifests/$OLD_TAG" > $MANIFEST_LOCATION
curl -X PUT -u "$USERPASS" -H "Content-Type: $CONTENT_TYPE" --data-binary "@$MANIFEST_LOCATION" "https://$NEW_REGISTRY/v2/$NEW_IMAGE/manifests/$NEW_TAG"

rm $MANIFEST_LOCATION

