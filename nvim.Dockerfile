FROM ubuntu:jammy 
ARG TAGS
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y software-properties-common curl git build-essential sudo && \
  apt-add-repository -y ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y ansible && \
  # apt-add-repository -y ppa:neovim-ppa/unstable && \
  # apt-get update && \
  # apt-get install -y neovim && \
  apt-get clean autoclean && \
  apt-get autoremove --yes

COPY . .
CMD ["/bin/bash"]

