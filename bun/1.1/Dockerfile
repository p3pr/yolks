FROM ubuntu:latest
LABEL org.opencontainers.image.source https://github.com/p3pr/yolks
WORKDIR /home/container
RUN apt-get update && apt-get install -y \
    curl unzip \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://bun.sh/install | bash
RUN hash -r
COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
