#!/usr/bin/env bash
#set -x

BASEIMAGESTR="nodejsansible:1.5"

IMAGESTR="gameswsserver:${GAMES_WS_SERVER_VERSION}"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

buildah config --env DEBIAN_FRONTEND=noninteractive "$ctr1"

echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesWSServer" "/tmp/gamesWSServer"
echo "LISTING 1.."
buildah run "$ctr1" -- ls -ltra /tmp
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /tmp/gamesWSServer

echo "BUILDING.."
buildah config --workingdir /tmp/gamesWSServer "$ctr1"

echo "ENTRYPOINTING.."
buildah config --entrypoint "npm run start" "$ctr1"

echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"

