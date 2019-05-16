#!/bin/bash

# We need the user to exist
# NOTE: The user(name) cannot be changed at runtime.
if [ -z "${USER}" ]; then
  echo "USER variable not set, invalid image!";
  exit 1
fi

# We need the group to exist
# NOTE: The group(name) cannot be changed at runtime.
if [ -z "${GROUP}" ]; then
  echo "GROUP variable not set, invalid image!";
  exit 1
fi

# Get active user id (either default or overridden one)
USER_ID=${PUID:=$DEFAULT_PUID}
USER_GID=${PGID:=$DEFAULT_PGID}

# Update user id and group id
# NOTE: Also changes permissions of home-folder
usermod -u ${USER_ID} ${USER}
groupmod -g ${USER_GID} ${GROUP}

# Change ownership of ALL files to new uid/gid
find / -xdev -user ${DEFAULT_PUID} -exec chown -h ${USER} {} \;
find / -xdev -group ${DEFAULT_PGID} -exec chgrp -h ${GROUP} {} \;

# Drop to user privilegies
exec su - "${USER}"
