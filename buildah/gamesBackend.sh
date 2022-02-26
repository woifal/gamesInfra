#!/usr/bin/env bash
#set -x
BASEIMAGESTR="oraclient:1.16"

IMAGESTR="gamesbackend:${GAMES_BACKEND_VERSION}"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

buildah config --env DEBIAN_FRONTEND=noninteractive "$ctr1"


echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesBackend" "/tmp/gamesBackend"

echo "ENTRYPOINTING.."
buildah config --workingdir /tmp/gamesBackend "$ctr1"
buildah config --entrypoint "npm run startProd" "$ctr1"

echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"
