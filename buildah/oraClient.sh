#!/usr/bin/env bash
#set -x

BASEIMAGESTR="nodejsansible:1.5"

IMAGESTR="oraclient:1.16"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

buildah config --env DEBIAN_FRONTEND=noninteractive "$ctr1"


echo "COPYING SOURCES.."
echo "COPYING SOURCES.."
buildah copy "$ctr1" "../files/instantclient-basic-linux.x64-21.1.0.0.0.zip" "/tmp/instantclient-basic-linux.x64-21.1.0.0.0.zip"

echo "INSTALLING PACKAGES"
echo "INSTALLING PACKAGES"
buildah run "$ctr1" -- apt-get install -y libaio1
buildah run "$ctr1" -- apt-get install -y unzip
buildah run "$ctr1" -- apt-get install -y vim

buildah config --workingdir /tmp "$ctr1"
buildah run "$ctr1" -- unzip instantclient-basic-linux.x64-21.1.0.0.0.zip
buildah run "$ctr1" -- echo /tmp/instantclient_21_1 >/etc/ld.so.conf.d/oracle-instantclient.conf
buildah run "$ctr1" -- ldconfig
buildah config --env LD_LIBRARY_PATH=/tmp/instantclient_21_1:$LD_LIBRARY_PATH "$ctr1"
buildah config --env PATH=/tmp/instantclient_21_1:$PATH "$ctr1"

#buildah run "$ctr1" -- export LD_LIBRARY_PATH=/tmp/instantclient_21_1:$LD_LIBRARY_PATH
#buildah run "$ctr1" -- export PATH=/tmp/instantclient_21_1:$PATH
buildah run "$ctr1" -- echo 'export LD_LIBRARY_PATH=/tmp/instantclient_21_1:$LD_LIBRARY_PATH' >>~/.bashrc
buildah run "$ctr1" -- echo 'export PATH=/tmp/instantclient_21_1:$PATH' >>~/.bashrc


echo "COPYING SOURCES.."
echo "COPYING SOURCES.."
buildah copy "$ctr1" "../files/Wallet_gamesBackend.zip" "/tmp/Wallet_gamesBackend.zip"

echo "INSTALLING WALLET.."
echo "INSTALLING WALLET.."
buildah run "$ctr1" -- cp /tmp/Wallet_gamesBackend.zip /tmp/instantclient_21_1/network/admin/.
buildah config --workingdir /tmp/instantclient_21_1/network/admin "$ctr1"
buildah run "$ctr1" -- unzip -o Wallet_gamesBackend.zip

echo "COMITTING.."
echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"


#buildah push ${IMAGESTR} docker://docker.io/woifal/${IMAGESTR}
