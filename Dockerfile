FROM invent-registry.kde.org/neon/docker-images/plasma:unstable
RUN sudo userdel -r ubuntu

ARG USERNAME=neon
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN curl 'https://invent.kde.org/sdk/kde-builder/-/raw/master/scripts/initial_setup.sh' > initial_setup.sh && \
    bash initial_setup.sh
ADD kde-builder.yaml /home/neon/.config/kde-builder.yaml
ENV PATH="$PATH:/home/neon/.local/bin"
USER neon
RUN yes | kde-builder --install-distro-packages
