alias containercmd=podman

# !!!!
#sudo iptables -I INPUT -m state --state NEW -p tcp --dport 9001 -j ACCEPT
#sudo iptables -I INPUT -m state --state NEW -p tcp --dport 9002 -j ACCEPT

containercmd container rm -f gamesbackend
containercmd run -d -it --name gamesbackend -e dbPassword_prod=${dbPassword_prod}  -p 9001:9000 localhost/gamesbackend:1.16
containercmd run -d -it --name gamesbackend --entrypoint /bin/bash localhost/gamesbackend:1.16
containercmd logs -f gamesbackend
#docker exec -it gamesbackend /bin/bash

#containercmd container rm -f gamesbackenddev
#containercmd run -d -it --name gamesbackenddev -e dbPassword_dev=${dbPassword_dev}  -p 9001:9000 woifal/gamesbackend_dev:1.8
#docker exec -it gamesbackend /bin/bash

#containercmd container rm -f gameswsserver
#docker run -d -it --name nodeplusora -p 9001:9000 --entrypoint /bin/bash nodeplusora:0.1
#containercmd run -d -it --name gameswsserver -p 9002:8044 woifal/gameswsserver:1.5
#docker exec -it gamesbackend /bin/bash

#containercmd container rm -f gamesapp
#docker run -d -it --name gamesapp --entrypoint /bin/bash woifal/gamesapp:0.5
#containercmd run -d -it --name gamesapp -e PORT=80 -p 80:80 -dt localhost/gamesapp:1.16
#containercmd logs -f gamesapp

#docker exec -it gamesbackend /bin/bash



#
#
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
#   NEED TO INSTALL "kill-port" in backend image!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!!!!!!!!!!!!!!!!!!
#
#
#
#
#