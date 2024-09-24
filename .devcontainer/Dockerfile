FROM debian:bookworm-slim AS uv

ENV UV_INSTALL_DIR="/"

RUN apt-get -qq update
RUN apt-get -qq install -y --no-install-recommends ca-certificates curl

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

FROM ghcr.io/opentofu/opentofu:latest AS opentofu

FROM mcr.microsoft.com/devcontainers/base:debian

ENV UV_LINK_MODE="copy"

COPY --from=opentofu /usr/local/bin/tofu /usr/local/bin/tofu
COPY --from=uv /bin/uv /usr/local/bin/uv

RUN apt-get -qq update; \
  apt-get -qq install -y --no-install-recommends ca-certificates curl gnupg2; \
  curl -sSfL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg; \
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list; \
  apt-get -qq update; \
  apt-get -qq install -y --no-install-recommends bridge-utils clang dnsmasq init kmod libvirt-clients libvirt-daemon-system libvirt-dev pkg-config qemu-kvm qemu-utils systemd vagrant; \
  usermod -aG libvirt,kvm vscode

ENTRYPOINT [ "/sbin/init" ]
