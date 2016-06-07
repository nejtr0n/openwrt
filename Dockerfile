FROM debian:jessie
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install subversion git g++ libncurses5-dev zlib1g-dev gawk libssl-dev unzip make bzip2 wget python file xz-utils gettext build-essential -y
RUN useradd -ms /bin/bash openwrt
USER openwrt
RUN git clone git://git.openwrt.org/15.05/openwrt.git /home/openwrt/openwrt
WORKDIR /home/openwrt/openwrt
RUN ./scripts/feeds update -a && ./scripts/feeds install -a
RUN make prereq && make tools/install && make toolchain/install
