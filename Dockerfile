FROM nvidia/cuda:10.0-cudnn7-runtime
MAINTAINER KadynCBR
RUN apt-get update -y && \
apt-get install software-properties-common -y && \
add-apt-repository ppa:deadsnakes/ppa -y && \
apt-get update && apt-get install python3.7 python3.7-dev python3-pip python3-virtualenv -y && \
apt-get install libxext6 libxrender-dev libsm6 -y

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m virtualenv --python=/usr/bin/python3.7 $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt



RUN mkdir /work
WORKDIR /work
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"] 