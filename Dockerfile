ARG BUILD_FROM=balena:raspbian

FROM $BUILD_FROM

ARG snapcast_version=0.25.0

RUN  apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*
RUN  wget https://github.com/badaix/snapcast/releases/download/v${snapcast_version}/snapserver_${snapcast_version}-1_armhf.deb
RUN  dpkg -i snapserver_${snapcast_version}-1_armhf.deb \
  ;  apt-get update \
  && apt-get -f install -y \
  && rm -rf /var/lib/apt/lists/*
RUN /usr/bin/snapserver -v

ENV TZ=Europe/Berlin

EXPOSE 1704 1705 1780
ENTRYPOINT ["/bin/bash","-c","/usr/bin/snapserver"]
