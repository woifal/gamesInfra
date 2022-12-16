. ./versions.sh


echo "#"
echo "#"
echo "#"
echo "TAGGING gamesbackend:${GAMES_BACKEND_VERSION}"
echo "#"
echo "#"
echo "#"
docker tag gamesbackend:${GAMES_BACKEND_VERSION} docker.io/woifal/gamesbackend:${GAMES_BACKEND_VERSION}
echo "#"
echo "#"
echo "#"
echo "PUSHING  gamesbackend:${GAMES_BACKEND_VERSION}"
docker image push docker.io/woifal/gamesbackend:${GAMES_BACKEND_VERSION}
echo "#"
echo "#"
echo "#"
#podman push localhost/gamesappbase:${GAMES_APP_BASE_VERSION} docker.io/woifal/gamesappbase:${GAMES_APP_BASE_VERSION}

echo "#"
echo "#"
echo "#"
echo "TAGGING gamesbackend:${GAMES_BACKEND_VERSION}"
echo "#"
echo "#"
echo "#"
docker tag  gamesappslim:${GAMES_APP_VERSION} docker.io/woifal/gamesappslim:${GAMES_APP_VERSION}
echo "#"
echo "#"
echo "#"
echo "PUSHING  gamesbackend:${GAMES_BACKEND_VERSION}"
docker image push docker.io/woifal/gamesappslim:${GAMES_APP_VERSION}
echo "#"
echo "#"
echo "#"
#podman push localhost/gameswsserver:${GAMES_WS_SERVER_VERSION} docker.io/woifal/gameswsserver:${GAMES_WS_SERVER_VERSION}
