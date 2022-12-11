FROM ghcr.io/sdr-enthusiasts/docker-baseimage:rtlsdr

MAINTAINER Pete St. Marie

RUN apt-get update \
&& apt-get install -y libasound2-dev libgps-dev libudev-dev apt-utils git gcc g++ make cmake sudo

RUN cd ~ \
&& git clone https://www.github.com/wb2osz/direwolf \
&& cd ~/direwolf \
&& git checkout dev \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make -j4

RUN sudo make install

COPY sdr-igate.conf.template ./
COPY run.sh ./

CMD ./run.sh
