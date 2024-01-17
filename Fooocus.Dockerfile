FROM nvidia/cuda:12.3.1-base-ubuntu20.04
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /fooocus

EXPOSE 7865/tcp

COPY do_setup.py /fooocus/do_setup.py

RUN apt-get update && apt-get install -y python3 git python3-pip libgl1 libgl1-mesa-glx libglib2.0-0
RUN git clone https://github.com/lllyasviel/Fooocus.git /fooocus/repo && cp -R /fooocus/repo/* /fooocus && rm -rf /fooocus/repo
RUN pip install -r requirements_versions.txt
RUN python3 do_setup.py

CMD python3 launch.py --listen