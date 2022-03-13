# pytorch versionに注意
FROM nvidia/cuda:11.3.0-cudnn8-runtime-ubuntu20.04

# 時間設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# install basic dependencies
RUN apt-get -y update && apt-get install -y \
    sudo \
    wget \
    cmake \
    vim \
    git \
    tmux \
    zip \
    unzip \
    gcc \
    g++ \
    build-essential \
    ca-certificates \
    software-properties-common \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libpng-dev \
    libfreetype6-dev \
    libgl1-mesa-dev \
    libsndfile1 \
    zsh \
    xonsh \
    neovim \
    nodejs \
    npm \
    curl

RUN apt-get install -y \
    python3.8  \
    python3.8-dev \
    python3-pip \
    python3-ipdb

# node js を最新Verにする
RUN npm -y install n -g && \
    n stable && \
    apt purge -y nodejs npm


# 本当はハードコーディングではなくローカルのidと合わせた方が良い
# https://qiita.com/yohm/items/047b2e68d008ebb0f001
ARG DOCKER_UID=1000
ARG DOCKER_USER="user"
ARG DOCKER_PASSWORD="kuzira"
RUN useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd
USER ${DOCKER_USER}

ENV HOME=/home/user
ENV PATH /usr/bin:$PATH

WORKDIR ${HOME}
# install common python packages
COPY ./requirements.txt ./
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt && \
    rm requirements.txt

RUN pip3 install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
# install dotfiles
RUN git clone https://github.com/kuto5046/dotfiles.git
RUN bash ./dotfiles/.bin/install.sh

# make workdir
RUN mkdir ${HOME}/work/
WORKDIR ${HOME}/work/