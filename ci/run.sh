
# !!!!
#sudo iptables -I INPUT -m state --state NEW -p tcp --dport 9001 -j ACCEPT
#sudo iptables -I INPUT -m state --state NEW -p tcp --dport 9002 -j ACCEPT

podman container rm -f gamesbackend
#docker run -d -it --name nodeplusora -p 9001:9000 --entrypoint /bin/bash nodeplusora:0.1
podman run -d -it --name gamesbackend -e dbPassword=${dbPassword}  -p 9001:9000 woifal/gamesbackend:1.0
#docker exec -it gamesbackend /bin/bash

podman container rm -f gameswsserver
#docker run -d -it --name nodeplusora -p 9001:9000 --entrypoint /bin/bash nodeplusora:0.1
podman run -d -it --name gameswsserver -p 9002:8044 woifal/gameswsserver:1.0
#docker exec -it gamesbackend /bin/bash

podman container rm -f gamesapp
#docker run -d -it --name gamesapp --entrypoint /bin/bash woifal/gamesapp:0.5
podman run -d -it --name gamesapp -e PORT=80 -p 80:80 -dt woifal/gamesapp:1.0
#docker exec -it gamesbackend /bin/bash
