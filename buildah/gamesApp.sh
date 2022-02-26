#!/usr/bin/env bash
#set -x
BASEIMAGESTR="gamesappbase:${GAMES_APP_BASE_VERSION}"

IMAGESTR="gamesapp:${GAMES_APP_VERSION}"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

buildah config --env DEBIAN_FRONTEND=noninteractive "$ctr1"
buildah config --env BROWSER= "$ctr1"

#buildah run "$ctr1" -- apt-get update

echo "LISTING 1.."
buildah run "$ctr1" -- ls -ltra /tmp
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /tmp/gamesApp


echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesApp" "/tmp/gamesApp"
echo "LISTING 1.."
buildah run "$ctr1" -- ls -ltra /tmp
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /tmp/gamesApp

echo "CONFIGURING.."
buildah config --workingdir /tmp/gamesApp "$ctr1"

echo "BUILDING.."
buildah run "$ctr1" -- npm run build
echo "INSTALLING SERVE.."
buildah run "$ctr1" -- npm install -g serve

echo "ENTRYPOINTING.."
buildah config --entrypoint "serve -d build" "$ctr1"

echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"
