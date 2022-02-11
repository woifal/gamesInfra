#!/usr/bin/env bash
#set -x

BASEIMAGESTR="nodejsansible:1.5"

IMAGESTR="gamesapp:2.3"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

buildah config --env DEBIAN_FRONTEND=noninteractive "$ctr1"
buildah config --env BROWSER= "$ctr1"

#buildah run "$ctr1" -- apt-get update


echo "COPYING SOURCES.."
echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesApp" "/tmp/gamesApp"
echo "LISTING 1.."
echo "LISTING 1.."
buildah run "$ctr1" -- ls -ltra /tmp
echo "LISTING 2.."
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /tmp/gamesApp

echo "BUILDING.."
echo "BUILDING.."
buildah config --workingdir /tmp/gamesApp "$ctr1"

buildah run "$ctr1" -- npm install
buildah run "$ctr1" -- npm run build
buildah run "$ctr1" -- npm install -g serve


echo "ENTRYPOINTING.."
echo "ENTRYPOINTING.."
buildah config --entrypoint "serve -d build" "$ctr1"

echo "COMITTING.."
echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"


#buildah push ${IMAGESTR} docker://docker.io/woifal/${IMAGESTR}