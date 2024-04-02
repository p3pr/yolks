FROM ubuntu:latest
LABEL org.opencontainers.image.source https://github.com/p3pr/yolks

RUN apt-get update && apt-get install -y \
    curl unzip \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -d /home/container -m container -s /bin/bash

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Run the installation script and restart shell session
RUN curl -fsSL https://bun.sh/install | bash

USER root
RUN mv ~/.bun/bin/bun /usr/local/bin/bun \
    && chown root:root /usr/local/bin/bun \
    && chmod +x /usr/local/bin/bun
USER container

RUN echo 'source ~/.bashrc' >> ~/.bash_profile

# After the shell restart, add bun to PATH
RUN echo 'export PATH="$PATH:/usr/local/bin"' >> ~/.bashrc

# Verify bun installation
RUN /usr/local/bin/bun -v

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint script as the command to run when the container starts
CMD ["/bin/bash", "/entrypoint.sh"]