# ~/containers/aosp/Dockerfile
FROM ubuntu:24.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      bc bison build-essential ccache ca-certificates curl flex g++-multilib gcc-multilib \
      git git-lfs gnupg gperf imagemagick protobuf-compiler python3-protobuf \
      lib32readline-dev lib32z1-dev libdw-dev libelf-dev libgnutls28-dev lz4 \
      libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool \
      squashfs-tools xsltproc xxd zip zlib1g-dev python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://storage.googleapis.com/git-repo-downloads/repo -o /usr/local/bin/repo \
    && chmod +x /usr/local/bin/repo

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      zsh nano tmux unzip \
    && rm -rf /var/lib/apt/lists/*

# 避免 bind mount 带来的 git 属主检查告警
RUN git config --system --add safe.directory '*'
