FROM ubuntu:latest

LABEL maintainer="akajhon" \
    email="joaopedrorosa03@protonmail.com"

# Environment Variables
ENV HOME=/root
ENV TOOLS="/opt"
ENV ADDONS="/usr/share/addons"
ENV CONFIGS="/usr/share/configs"
ENV RESULTS="/root/results"
ENV WORDLISTS="/usr/share/wordlists"
ENV GO111MODULE=on
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=${HOME}/:${GOPATH}/bin:${GOROOT}/bin:${PATH}
ENV DEBIAN_FRONTEND=noninteractive

# Create working dirs
WORKDIR /root
RUN mkdir $WORDLISTS && mkdir $ADDONS && mkdir $CONFIGS && mkdir $RESULTS

# Install Essentials
RUN apt-get update && \
  apt-get install -y --no-install-recommends --fix-missing \
  apt-utils \
  awscli \
  build-essential \
  curl \
  dnsutils \
  gcc \
  git \
  iputils-ping \
  jq \
  libgmp-dev \
  libpcap-dev \
  make \
  nano \
  vim \
  netcat \
  net-tools \
  nodejs \
  npm \
  perl \
  php \
  proxychains \
  python3 \
  python3-pip \
  ssh \
  tor \
  tmux \
  tzdata \
  wget \
  whois \
  zip \
  unzip \
  gzip \
  zsh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Install Python common dependencies
RUN python3 -m pip install --upgrade setuptools wheel termcolor

# Install go
RUN cd /opt && \
  ARCH=$( arch | sed s/aarch64/arm64/ | sed s/x86_64/amd64/ ) && \
  wget https://dl.google.com/go/go1.21.6.linux-${ARCH}.tar.gz && \
  tar -xvf go1.21.6.linux-${ARCH}.tar.gz && \
  rm -rf /opt/go1.21.6.linux-${ARCH}.tar.gz && \
  mv go /usr/local

COPY setup_cli.sh /root
COPY setup_tools.sh /root
COPY /szh /root/zsh
COPY /Recon /root/Recon 

RUN chmod +x /root/setup_cli.sh
RUN chmod +x /root/setup_tools.sh
RUN chmod +x /root/Recon/mainRecon.sh

RUN ./setup_tools.sh
RUN ./setup_cli.sh

#ENTRYPOINT ["bash", "/root/startup.sh"]
CMD ["/bin/zsh"]
