#!/usr/bin/env bash
#set -x
BASEIMAGESTR="nodejsansible:${NODE_JS_BASE_VERSION}"

IMAGESTR="gamesappbase:$GAMES_APP_BASE_VERSION"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

buildah config --env DEBIAN_FRONTEND=noninteractive "$ctr1"
buildah config --env BROWSER= "$ctr1"

#buildah run "$ctr1" -- apt-get update


echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesApp" "/tmp/gamesApp"
echo "LISTING 1.."
buildah run "$ctr1" -- ls -ltra /tmp
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /tmp/gamesApp

echo "BUILDING.."
buildah config --workingdir /tmp/gamesApp "$ctr1"

echo "INSTALLING.."
buildah run "$ctr1" -- npm install

echo "INSTALLING SERVE.."
npm install -g serve

echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"
