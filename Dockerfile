FROM ubuntu:20.04 as base

### Stage 1 - add/remove packages ###

# - Symlink variant-specific scripts to default location
# - Upgrade base security packages, then clean packaging leftover
# - Add S6 for zombie reaping, boot-time coordination, signal transformation/distribution: @see https://github.com/just-containers/s6-overlay#known-issues-and-workarounds
# - Add goss for local, serverspec-like testing
RUN /bin/bash -e /scripts/ubuntu_apt_config.sh && \
    /bin/bash -e /scripts/ubuntu_apt_cleanmode.sh && \
    ln -s /scripts/clean_ubuntu.sh /clean.sh && \
    ln -s /scripts/security_updates_ubuntu.sh /security_updates.sh && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    /bin/bash -e /security_updates.sh && \
    apt-get install -yqq \
      curl \
      gpg \
      apt-transport-https \
    && \
    /bin/bash -e /scripts/install_s6.sh && \
    /bin/bash -e /scripts/install_goss.sh && \
    apt-get remove --purge -yq \
        curl \
        gpg \
    && \
    /bin/bash -e /clean.sh && \
    # out of order execution, has a dpkg error if performed before the clean script, so keeping it here,
    apt-get remove --purge --auto-remove systemd --allow-remove-essential -y
