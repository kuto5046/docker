FROM nvcr.io/nvidia/pytorch:22.03-py3

# 時間設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get -y update && apt-get install -y \
    sudo \
    zip \
    unzip \
    tmux \
    zsh \
    xonsh \
    neovim \
    # for opencv
    libgl1-mesa-dev \
    nodejs \
    npm \
    curl 
    
# node jsを最新版にする
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
RUN echo ${DOCKER_PASSWORD} | sudo -S chown -R ${DOCKER_USER} /opt/conda/
USER ${DOCKER_USER}

ENV HOME=/home/user
ENV PATH ${HOME}/.local/bin:$PATH

# install common python packages
COPY ./requirements.txt ./
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    rm requirements.txt

# 時間がかかるので不要な場合はコメントアウトしてもOK
# RUN conda install --yes -c conda-forge google-cloud-bigquery \
#   google-cloud-bigquery-storage \
#   pandas-gbq

# cpu-verとgpu-verが共存しておりtorch_geometricが使えないためreinstallする
# RUN pip uninstall -y torch torchvision torchtext
# RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
# RUN pip install torch-scatter torch-sparse torch-cluster torch-spline-conv torch-geometric -f https://data.pyg.org/whl/torch-1.12.0+cu116.html


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
