ARG BASE_IMAGE=docker/sandbox-templates:shell-docker
FROM ${BASE_IMAGE}

ARG BASE_IMAGE

USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends fd-find && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf "$(command -v fdfind)" /usr/local/bin/fd

ARG PI_VERSION=latest

USER root
ADD --chmod=644 https://registry.npmjs.org/@earendil-works%2Fpi-coding-agent/${PI_VERSION} /tmp/pi-latest.json

USER agent
RUN version="$(node -p 'require("/tmp/pi-latest.json").version')" && \
    npm install -g "@earendil-works/pi-coding-agent@${version}" && \
    pi --version

USER root
RUN ln -sf "$(npm prefix -g)/bin/pi" /usr/local/bin/pi

LABEL com.docker.sandboxes.start-docker="true"

LABEL com.docker.sandboxes.flavor="pi"

LABEL com.docker.sandboxes.base="${BASE_IMAGE}"

USER agent
WORKDIR /home/agent
CMD ["pi"]
