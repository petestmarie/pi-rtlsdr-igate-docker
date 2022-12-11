FROM ghcr.io/sdr-enthusiasts/docker-baseimage:rtlsdr

MAINTAINER Pete St. Marie

RUN apt-get update \
&& apt-get install -y libasound2-dev libgps-dev apt-utils git

RUN cd ~ \
&& git clone https://www.github.com/wb2osz/direwolf \
&& cd ~/direwolf \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make -j4 \
&& sudo make install

COPY sdr-igate.conf.template ./
COPY run.sh ./

CMD ./run.sh
