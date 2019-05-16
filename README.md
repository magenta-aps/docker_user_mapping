# Docker User Mapping
Example container for how to update UID and GID at container creation-time.

## Usage:
```
docker build -t magentadk/docker_user_mapping .
docker run --rm -it -e PUID=1111 -e PGID=1200 magentadk/docker_user_mapping /bin/bash
```

## Configuration:
The example exposes 4 environment variables:

* `PUID`: Process User ID: The ID of the default user after the entry-point has run.
* `PGID`: Process Group ID: The ID of the default group after the entry-point has run.
* `USER`: Username: The name of the default user after the entry-point has run.
* `GROUP`: Groupname: The name of the default group after the entry-point has run.
