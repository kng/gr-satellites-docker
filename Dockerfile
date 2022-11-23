FROM debian:bookworm
MAINTAINER sa2kng <knegge@gmail.com>
RUN apt-get -y update && apt -y upgrade && apt-get -y install --no-install-recommends git build-essential pkg-config cmake gnuradio-dev liborc-0.4-dev libsndfile1-dev libspdlog-dev python3-construct python3-requests python3-pip

RUN git clone --branch main --depth 1 https://github.com/daniestevez/gr-satellites.git
RUN cd gr-satellites &&\
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr &&\
    cmake --build build --target install

ENV PYTHONPATH /usr/lib/python3.10/site-packages/
RUN groupadd -g 1000 grsat && useradd -g grsat -m -d /home/grsat -s /bin/bash -u 1000 grsat
COPY entrypoint.sh /usr/bin
WORKDIR /home/grsat
USER grsat
ENTRYPOINT ["entrypoint.sh"]
CMD ["bash"]

