FROM gcr.io/kaggle-gpu-images/python:v134

# 時間設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get -y update && apt-get install -y \
    tmux \
    zsh \
    xonsh

# neovim v0.9.1
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim


# 既存のユーザを削除
# RUN sudo userdel -r jupyter  

# 本当はハードコーディングではなくローカルのidと合わせた方が良い
# https://qiita.com/yohm/items/047b2e68d008ebb0f001
ARG DOCKER_UID=1000
ARG DOCKER_USER="user"
ARG DOCKER_PASSWORD="kuzira"

# 既存のjupyterユーザをuserという名前に変更(ホームディレクトリも変更)
RUN sudo usermod -l ${DOCKER_USER} -d /home/${DOCKER_USER} -m jupyter

RUN echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd
# RUN echo ${DOCKER_PASSWORD} | sudo -S chown -R ${DOCKER_USER} /opt/conda/
USER ${DOCKER_USER}

ENV HOME=/home/${DOCKER_USER}
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
