FROM docker.io/debian:stable-20251020-slim

ENV GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests --yes \
    'build-essential' \
    'ca-certificates' \
    'clang' \
    'flex' \
    'bison' \
    'g++' \
    'gawk' \
    'gcc-multilib' \
    'gettext' \
    'git' \
    'libncurses5-dev' \
    'libssl-dev' \
    'python3' \
    'python3-pip' \
    'python3-setuptools' \
    'python3-distutils-extra' \
    'rsync' \
    'unzip' \
    'zlib1g-dev' \
    'file' \
    'wget' \
  && \
  rm -f -r '/var/lib/apt/' && \
  rm -f -r '/var/cache/apt/' && \
  useradd -m -s '/bin/bash' -U 'buildbot'

USER buildbot

WORKDIR /workdir
