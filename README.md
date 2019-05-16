# Docker User Mapping
Example container for how to update UID and GID at container creation-time.

## Usage:
```
docker build -t magentadk/docker_user_mapping .
docker run --rm -it -e PUID=1111 -e PGID=1200 magentadk/docker_user_mapping /bin/bash
```
