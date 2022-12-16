. ./versions.sh

alias containercmd=docker

# !!!!
#sudo iptables -I INPUT -m state --state NEW -p tcp --dport 9001 -j ACCEPT
#sudo iptables -I INPUT -m state --state NEW -p tcp --dport 9002 -j ACCEPT

##containercmd container rm -f gamesbackend
##containercmd run -d -it --name gamesbackend -e dbPassword_prod=${dbPassword_prod}  -p 9001:9000 localhost/gamesbackend:${GAMES_BACKEND_VERSION}
##containercmd logs -f gamesbackend

#docker exec -it gamesbackend /bin/bash

#containercmd container rm -f gamesbackenddev
#containercmd run -d -it --name gamesbackenddev -e dbPassword_dev=${dbPassword_dev}  -p 9001:9000 woifal/gamesbackend_dev:1.8
#docker exec -it gamesbackend /bin/bash

#containercmd container rm -f gameswsserver
#containercmd run -d -it --name gameswsserver -p 9002:8044 woifal/gameswsserver:${GAMES_WS_SERVER_VERSION}
#docker exec -it gamesbackend /bin/bash

##containercmd container rm -f gamesapp
#containercmd run -d -it --name gamesapp -p 3001:3000 -dt localhost/gamesapp:${GAMES_APP_VERSION}
##containercmd run -d -it --name gamesapp -p 3001:3000 -dt localhost/gamesappslim:${GAMES_APP_VERSION}
##containercmd logs -f gamesapp

#docker exec -it gamesbackend /bin/bash

