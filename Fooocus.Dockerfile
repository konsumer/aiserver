FROM nvidia/cuda:12.3.1-base-ubuntu20.04
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /fooocus
VOLUME /fooocus/models/checkpoints/

EXPOSE 7865/tcp

RUN apt-get update && apt-get install -y python3 git python3-pip libgl1 libgl1-mesa-glx libglib2.0-0
RUN git clone https://github.com/lllyasviel/Fooocus.git /fooocus/repo && /fooocus/repo/* /fooocus && rm -rf /fooocus/repo
RUN pip install -r requirements_versions.txt

CMD python3 entry_with_update.py --listen