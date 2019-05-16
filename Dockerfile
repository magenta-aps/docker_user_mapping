FROM debian:stretch

# Set user and group name
ENV DEFAULT_USER=default_user
ENV DEFAULT_GROUP=default_group

# Default process user and group id
ENV DEFAULT_PUID=1000
ENV DEFAULT_PGID=1000

# Create default user and group
RUN groupadd --gid "${DEFAULT_PGID}" "${DEFAULT_GROUP}"
RUN useradd \
      --uid ${DEFAULT_PUID} \
      --gid ${DEFAULT_PGID} \
      --create-home \
      --shell /bin/bash \
      ${DEFAULT_USER}

COPY user-mapping.sh /
RUN chmod u+x /user-mapping.sh

ENTRYPOINT ["/user-mapping.sh"]
