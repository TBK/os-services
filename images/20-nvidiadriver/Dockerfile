FROM ubuntu:focal
# FROM amd64=ubuntu:focal arm64=arm64v8/ubuntu:focal

ENV distribution ubuntu20.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends iptables openssh-server rsync locales \
                           sudo vim less curl ca-certificates psmisc htop iproute2 \
                           net-tools bash-completion iputils-ping wget \
                           gcc make linux-headers-generic gnupg \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/ssh/*key*

RUN echo "KERNEL_VERSION" = ${distribution}

RUN curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | sudo apt-key add -

RUN curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

RUN apt-get update \
  && apt-get install -y nvidia-container-runtime

WORKDIR /dist
COPY build.sh /dist/
COPY ubuntu-build.sh /dist/

RUN chmod 755 /dist/build.sh

CMD ["/dist/build.sh"]

ENTRYPOINT ["/usr/bin/ros", "entrypoint"]
