#!/usr/bin/env bash
set -x


BASEIMAGESTR="nginx"

IMAGESTR="gamesnginx_letsencrypt:$GAMES_NGINX_VERSION"
echo "BUILDAH START"

export ctr1=$(buildah from ${BASEIMAGESTR})
echo "BUILDAH CONTAINER IS >${ctr1}<"

CMD /bin/bash -c "nginx -g 'daemon off;'" 

echo "COPYING SOURCES.."
buildah copy "$ctr1" "../../gamesNginx/nginx/nginx.conf.template_letsencrypt" "/etc/nginx/conf.d/default.conf"
buildah copy "$ctr1" "../../gamesNginx/./html_letsencrypt" "/usr/share/nginx/html"
echo "LISTING 2.."
buildah run "$ctr1" -- ls -ltra /etc/nginx/conf.d
buildah run "$ctr1" -- find /usr/share/nginx/html

echo "BUILDING.."

echo "LISTING 5.."
buildah run "$ctr1" -- cat /etc/nginx/conf.d/default.conf

echo "ENTRYPOINTING.."
buildah config --entrypoint "nginx -g 'daemon off;'" "$ctr1"


echo "COMITTING.."
buildah commit "$ctr1" "${IMAGESTR}"

