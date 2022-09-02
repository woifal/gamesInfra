#!/usr/bin/env bash
#set -x


BASEIMAGESTR="nginx"

IMAGESTR="gamesnginx:$GAMES_NGINX_VERSION"
echo "BUILDAH START"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"


echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesNginx/nginx/nginx.conf.template" "/etc/nginx/conf.d/default.conf.template"
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /etc/nginx/conf.d

echo "BUILDING.."

echo "LISTING 5.."
buildah run "$ctr1" -- ls -ltra /etc/nginx/conf.d
buildah run "$ctr1" -- cat /etc/nginx/conf.d/default.conf.template

echo "ENTRYPOINTING.."
buildah config --entrypoint "envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && cat /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'" "$ctr1"


echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"

