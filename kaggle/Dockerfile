FROM gcr.io/kaggle-gpu-images/python:v122

# 時間設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get -y update && apt-get install -y \
    tmux \
    zsh \
    xonsh

# # node jsを最新版にする
# RUN npm -y install n -g && \
#     n stable && \
#     apt purge -y nodejs npm

# neovim v0.81
RUN wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
RUN apt install ./nvim-linux64.deb

ENV HOME=/home/user
ENV PATH ${HOME}/.local/bin:$PATH

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


ENV PYTHONPATH ${HOME}/work:$PYTHONPATH

# shellをxonshにする
RUN xonsh
ENV SHELL /usr/bin/xonsh
