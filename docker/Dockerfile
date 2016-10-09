FROM resin/rpi-raspbian:jessie-20160831

RUN apt-get update \
    && apt-get install -y \
               chromium-browser \
               xorg \
               matchbox-window-manager \
               dbus-x11 \
               xdotool \
               netcat \
               build-essential \
               cmake \
               curl \
               git \
               lsb-release

RUN cd && \ 
    git clone --depth 1 https://github.com/raspberrypi/userland.git && \
    cd userland && \
   ./buildme

RUN cd && \
    curl -Lf --progress-bar --url http://odroidxu.leeharris.me.uk/xu3/chromium-widevine-1.4.8.823-2-armv7h.pkg.tar.xz -o chromium-widevine.tar.xz && \
    tar xf chromium-widevine.tar.xz && \
    cp usr/lib/chromium/libwidevinecdm*.so /usr/lib/chromium-browser/ && \
    chmod 755 /usr/lib/chromium-browser/libwidevinecdm*.so && \
    rm -rf usr

COPY 10-inputs.conf /etc/X11/xorg.conf.d/
COPY run.sh /tmp
COPY input.sh /tmp

CMD /tmp/run.sh
