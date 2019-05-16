#!/bin/bash

# Get active ids (either default or overridden ones)
USER_ID=${PUID:=$DEFAULT_PUID}
USER_GID=${PGID:=$DEFAULT_PGID}
# Get active names
USER_NAME=${USER:=$DEFAULT_USER}
GROUP_NAME=${GROUP:=$DEFAULT_GROUP}

# Update user id and group id
# NOTE: Also changes permissions of home-folder
usermod -u ${USER_ID} ${DEFAULT_USER}
groupmod -g ${USER_GID} ${DEFAULT_GROUP}

# Change ownership of ALL files to new uid/gid
find / -xdev -user ${DEFAULT_PUID} -exec chown -h ${DEFAULT_USER} {} \;
find / -xdev -group ${DEFAULT_PGID} -exec chgrp -h ${DEFAULT_GROUP} {} \;

# Update username
usermod --login ${USER_NAME} --move-home --home /home/${USER_NAME} ${DEFAULT_USER}
groupmod --new-name ${GROUP_NAME} ${DEFAULT_GROUP}

# Drop to user privilegies
exec su - "${USER}"
