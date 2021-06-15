# Container image that runs your code
FROM archlinux/archlinux:base-devel

ENV USER='build'

# Set user
RUN useradd -m ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# Prepare the environment
RUN chown -R ${USER} /github/home /github/workspace
RUN pacman -Syu --noconfirm --needed base-devel namcap
RUN sed -i "s|MAKEFLAGS=.*|MAKEFLAGS=-j$(nproc)|" /etc/makepkg.conf

USER ${USER}

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Executes `entrypoint.sh` when the Docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
