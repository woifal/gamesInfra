REPO_PATH=$1
echo "$(jq .major $REPO_PATH/version.json).$(jq .minor $REPO_PATH/version.json).$(jq .patch $REPO_PATH/version.json)"