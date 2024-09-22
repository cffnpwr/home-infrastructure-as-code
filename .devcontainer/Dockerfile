FROM debian:bookworm-slim AS uv

ENV UV_INSTALL_DIR="/"

RUN apt-get -qq update
RUN apt-get -qq install -y --no-install-recommends curl ca-certificates

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

FROM ghcr.io/opentofu/opentofu:latest AS opentofu

FROM mcr.microsoft.com/devcontainers/base:debian

ENV UV_LINK_MODE="copy"

COPY --from=opentofu /usr/local/bin/tofu /usr/local/bin/tofu
COPY --from=uv /bin/uv /usr/local/bin/uv
