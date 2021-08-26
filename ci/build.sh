#packer build packerPOCbaseImage.json
#packer build nodejs_ansible.json
#!!!!
echo "\n\n\n\n BUILDING oraclient_ansible"
packer build oraclient_ansible.json || return 1

#!
echo "\n\n\n\n BUILDING orawallet"
packer build orawallet.json || return 1
echo "\n\n\n\n BUILDING orawallet_dev"
packer build orawallet_dev.json || return 1

#!
echo "\n\n\n\n BUILDING gamesBackend_dev"
packer build gamesBackend_dev.json || return 1
echo "\n\n\n\n BUILDING gamesBackend"
packer build gamesBackend.json || return 1

echo "\n\n\n\n BUILDING gamesWSServer"
packer build gamesWSServer.json || return 1

echo "\n\n\n\n BUILDING gamesApp"
packer build gamesApp.json || return 1

