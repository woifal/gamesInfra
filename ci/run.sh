
# !!!!
docker container rm -f gamesbackend
#docker run -d -it --name nodeplusora -p 9001:9000 --entrypoint /bin/bash nodeplusora:0.1
docker run -d -it --name gamesbackend -p 9001:9000 -e dbPassword="1Blerl920la!" woifal/gamesbackend:0.2
#docker exec -it gamesbackend /bin/bash
