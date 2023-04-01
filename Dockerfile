FROM nvidia/cuda:11.7.0-base-ubuntu22.04

USER root

COPY ./requirements.txt /tmp

RUN apt-get update \
    && apt-get -y upgrade
RUN apt install -y curl python3 python3-distutils sudo gosu git wget build-essential less vim \
    && rm -rf /var/lib/apt/lists/*
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py \
    && pip install -r /tmp/requirements.txt

RUN echo ALL ALL=\(ALL:ALL\) NOPASSWD: ALL>> /etc/sudoers

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]