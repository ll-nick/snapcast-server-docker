ARG BUILD_FROM=balena:raspbian

FROM $BUILD_FROM

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    jq \
    sox && \
    rm -rf /var/lib/apt/lists/*
RUN DOWNLOAD_URL=$(curl -s https://api.github.com/repos/badaix/snapcast/releases/latest | jq -r '.assets[] | .browser_download_url' | grep snapserver.*1_armhf.deb) && \
    curl -L --output snapserver.deb $DOWNLOAD_URL
RUN apt-get update && \
    apt-get install ./snapserver.deb && \
    rm -rf snapserver.deb /var/lib/apt/lists/*
RUN /usr/bin/snapserver -v

ENV TZ=Europe/Berlin

EXPOSE 1704 1705 1780
ENTRYPOINT [ "/usr/bin/snapserver" ]
