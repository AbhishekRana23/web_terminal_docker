FROM ubuntu:18.04
LABEL maintainer "Sakthivel - msv300@gmail.com"

# Installing ca-certificates, cmake, curl, g++, git
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      ca-certificates \
      cmake \
      curl \
      g++ \
      git

RUN apt-get install -y \
    libjson-c3 \
    libjson-c-dev \
    libssl1.0.0 \
    libssl-dev

RUN apt-get install -y \
    libwebsockets8 \
    libwebsockets-dev \
    pkg-config \
    vim-common

RUN git clone --depth=1 https://github.com/tsl0922/ttyd.git /tmp/ttyd \
    && cd /tmp/ttyd && mkdir build && cd build \
    && cmake -DCMAKE_BUILD_TYPE=RELEASE .. \
    && make \
    && make install

RUN apt-get purge -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/ttyd

EXPOSE 7681

ENTRYPOINT ["ttyd"]

CMD ["bash"]