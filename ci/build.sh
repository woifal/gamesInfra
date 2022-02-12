. ../versions.sh

#packer build packer/packerPOCbaseImage.json

#packer build packer/nodejs.json
# NEW BASE BUILDS
#!!!!
#echo "\n\n\n\n BUILDING oraclient"
#packer build packer/oraclient.json || return 1
#!
#echo "\n\n\n\n BUILDING orawallet"
#packer build packer/orawallet.json || return 1
#echo "\n\n\n\n BUILDING orawallet_dev"
#packer build packer/orawallet_dev.json || return 1

# NEW STANDARD BUILDS
#echo "\n\n\n\n BUILDING gamesBackend_dev"
#packer build packer/gamesBackend_dev.json || return 1
#echo "\n\n\n\n BUILDING gamesBackend"
#packer build packer/gamesBackend.json || return 1

#echo "\n\n\n\n BUILDING gamesWSServer"
#packer build packer/gamesWSServer.json || return 1

#echo "\n\n\n\n BUILDING gamesApp"
#packer build packer/gamesApp.json || return 1

cd buildah
#. ./nodejs.sh
. ./gamesBackend.sh
#. ./gamesApp.sh
. ./gamesWSServer.sh
cd ..

