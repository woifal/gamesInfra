# Build images
### uses docker
. ./ci/build.sh

# Push images
### login to docker.io before!!
docker login
### uses docker.io
. ./ci/push.sh


# Run images
### login to docker.io before!!
docker login
### uses podman
. ./ci/run.sh


