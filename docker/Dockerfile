FROM nvidia/cuda:10.0-cudnn7-runtime
MAINTAINER KadynCBR
ARG USER_ID
ARG GROUP_ID
ARG USER_NAME
ARG PW=docker

RUN apt-get update -y && \
apt-get install software-properties-common -y && \
add-apt-repository ppa:deadsnakes/ppa -y && \
apt-get update && apt-get install python3.7 python3.7-dev python3-pip python3-virtualenv -y && \
apt-get install libxext6 libxrender-dev libsm6 -y


RUN useradd -m ${USER_NAME} --uid=${USER_ID} && echo "${USER_NAME}:${PW}" | \
  chpasswd

# Setup default user, when enter docker container
USER ${USER_ID}:${GROUP_ID}
WORKDIR /home/${USER}

# ENV VIRTUAL_ENV=/opt/venv
# RUN python3 -m virtualenv --python=/usr/bin/python3.7 $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"
# COPY ./requirements.txt /requirements.txt
# RUN pip3 install -r requirements.txt
# RUN mkdir /work
# WORKDIR /work


CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser"] 