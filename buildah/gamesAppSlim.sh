#!/usr/bin/env bash
#set -x


BASEIMAGESTR="node:16-alpine"

IMAGESTR="gamesappslim:$GAMES_APP_VERSION"
echo "BUILDAH START"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"


echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesApp/build" "/tmp/gamesApp/build"
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /tmp/gamesApp/build

echo "BUILDING.."
buildah config --workingdir /tmp/gamesApp "$ctr1"

echo "INSTALLING SERVE.."
buildah run "$ctr1" -- npm install -g serve
echo "LISTING 5.."
buildah run "$ctr1" -- ls -ltra /tmp/gamesApp

echo "ENTRYPOINTING.."
buildah config --entrypoint "serve -d build" "$ctr1"


echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"
