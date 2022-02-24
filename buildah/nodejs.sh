#!/usr/bin/env bash
#set -x

BASEIMAGESTR="ubuntu:20.04"

IMAGESTR="nodejsansible:${NODE_JS_BASE_VERSION}"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

buildah config --env DEBIAN_FRONTEND=noninteractive "$ctr1"

buildah run "$ctr1" -- apt-get update
buildah run "$ctr1" -- apt-get install -y curl
buildah run "$ctr1" -- curl -v
buildah run "$ctr1" -- apt-get install -y libssl1.0-dev
buildah run "$ctr1" -- apt-get install -y nodejs-dev
buildah run "$ctr1" -- apt-get install -y node-gyp
buildah run "$ctr1" -- apt-get install -y libnode-dev
buildah run "$ctr1" -- apt-get install -y libnode64
buildah run "$ctr1" -- apt-get install -y node-gyp
buildah run "$ctr1" -- apt-get install -y npm

#buildah run "$ctr1" -- apt-get update
buildah run "$ctr1" -- npm -v
buildah run "$ctr1" -- npm install -g npm@8.5.1

buildah run "$ctr1" -- echo 'PREPARING FOR NODEJS 16'
buildah run "$ctr1" -- echo 'PREPARING FOR NODEJS 16'
buildah run "$ctr1" -- echo 'PREPARING FOR NODEJS 16'
buildah run "$ctr1" -- bash -c "set -x; curl -fsSL https://deb.nodesource.com/setup_16.x | bash -"
buildah run "$ctr1" -- echo 'INSTALLING NODEJS'
buildah run "$ctr1" -- echo 'INSTALLING NODEJS'
buildah run "$ctr1" -- echo 'INSTALLING NODEJS'
buildah run "$ctr1" -- apt-get install -y nodejs
buildah run "$ctr1" -- echo 'NODE VERSION'
buildah run "$ctr1" -- echo 'NODE VERSION'
buildah run "$ctr1" -- echo 'NODE VERSION'
buildah run "$ctr1" -- node --version

buildah commit "$ctr1" "${IMAGESTR}"
