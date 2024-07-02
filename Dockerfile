FROM nvidia/cuda:11.6.1-runtime-ubuntu20.04

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    software-properties-common \
    build-essential yasm nasm ninja-build \
    unzip zip rsync git wget curl nano vim tmux htop cmake git sudo && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/archives/*

ARG USERNAME=docker
RUN addgroup --gid 1000 $USERNAME && \
    adduser --uid 1000 --gid 1000 --disabled-password --gecos '' $USERNAME && \
    adduser $USERNAME sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    USER=$USERNAME && \
    GROUP=$USERNAME && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5.1/fixuid-0.5.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-py39_24.4.0-0-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
ENV PATH /opt/conda/bin:$PATH
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN pip install --upgrade pip


RUN conda install -y pytorch=1.13.0 torchvision pytorch-cuda=11.6 -c pytorch -c nvidia
RUN conda install -y -c fvcore -c iopath -c conda-forge fvcore iopath
RUN conda install -y -c bottler nvidiacub
RUN conda install -y jupyter
RUN pip install scikit-image matplotlib imageio plotly opencv-python
RUN conda install -y pytorch3d -c pytorch3d
RUN pip install kornia chumpy mxnet-mkl==1.6.0 numpy==1.23.1 face_alignment moviepy
RUN apt-get update && apt-get install -y python3-opencv

COPY data /opt/data/

USER $USERNAME:$USERNAME
ENTRYPOINT ["fixuid", "-q"]
CMD ["fixuid", "-q", "bash"]
WORKDIR /workdir
