. ../versions.sh

podman push localhost/gamesbackend:{$GAMES_BACKEND_VERSION} docker.io/woifal/gamesbackend:{$GAMES_BACKEND_VERSION}
podman push localhost/gamesapp:{$GAMES_APP_VERSION} docker.io/woifal/gamesapp:{$GAMES_APP_VERSION}}
podman push localhost/gameswsserver:{$GAMES_WS_SERVER_VERSION} docker.io/woifal/gameswsserver:{$GAMES_WS_SERVER_VERSION}
