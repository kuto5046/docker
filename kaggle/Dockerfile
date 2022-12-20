FROM gcr.io/kaggle-gpu-images/python:v122

# 時間設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get -y update && apt-get install -y \
    tmux \
    zsh \
    xonsh

# neovim v0.81
RUN wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
RUN apt install ./nvim-linux64.deb

# 既存のユーザを削除
RUN sudo userdel -r jupyter  

# 本当はハードコーディングではなくローカルのidと合わせた方が良い
# https://qiita.com/yohm/items/047b2e68d008ebb0f001
ARG DOCKER_UID=1000
ARG DOCKER_USER="user"
ARG DOCKER_PASSWORD="kuzira"
RUN sudo useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd
RUN echo ${DOCKER_PASSWORD} | sudo -S chown -R ${DOCKER_USER} /opt/conda/
USER ${DOCKER_USER}

ENV HOME=/home/user
ENV PATH ${HOME}/.local/bin:$PATH
ENV PYTHONPATH ${HOME}/work:$PYTHONPATH
# shellをzshにする
ENV SHELL /usr/bin/zsh

WORKDIR ${HOME}/

# install common python packages
COPY ./requirements.txt ./
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    rm requirements.txt

# install dotfiles
RUN git clone https://github.com/kuto5046/dotfiles.git
RUN bash ./dotfiles/.bin/install.sh

# make workdir
RUN mkdir ${HOME}/work/
WORKDIR ${HOME}/work/
