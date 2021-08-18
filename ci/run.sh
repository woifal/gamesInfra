
# !!!!
docker container rm -f gamesbackend
#docker run -d -it --name nodeplusora -p 9001:9000 --entrypoint /bin/bash nodeplusora:0.1
docker run -d -it --name gamesbackend -p 9001:9000 -e dbPassword="1Am4amous!?!!" woifal/gamesbackend:0.4
#docker exec -it gamesbackend /bin/bash

docker container rm -f gameswsserver
#docker run -d -it --name nodeplusora -p 9001:9000 --entrypoint /bin/bash nodeplusora:0.1
docker run -d -it --name gameswsserver -p 9002:8044 woifal/gameswsserver:0.1
#docker exec -it gamesbackend /bin/bash
