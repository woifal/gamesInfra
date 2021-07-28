
# !!!!
docker container rm -f nodeplusora
#docker run -d -it --name nodeplusora -p 9001:9000 --entrypoint /bin/bash nodeplusora:0.1
docker run -d -it --name nodeplusora -p 9001:9000 nodeplusora:0.1
docker exec -it nodeplusora /bin/bash
