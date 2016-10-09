FROM resin/rpi-raspbian:jessie-20160831

COPY files /

RUN chmod u+x /chromium/input.sh /chromium/run.sh \
 && apt-get update \
 && apt-get install -y \
            build-essential \
            cmake \
            curl \
            git \
            chromium-browser \
            dbus-x11 \
            lsb-release \
            matchbox-window-manager \
            netcat \
            xdotool \
            xorg \
 && mkdir /build \
 && cd /build \
 && git clone --depth 1 https://github.com/raspberrypi/userland.git \
 && cd userland \
 && ./buildme \
 && cd /build \
 && curl -Lf --progress-bar --url http://odroidxu.leeharris.me.uk/xu3/chromium-widevine-1.4.8.823-2-armv7h.pkg.tar.xz -o chromium-widevine.tar.xz \
 && tar xf chromium-widevine.tar.xz \
 && cp usr/lib/chromium/libwidevinecdm*.so /usr/lib/chromium-browser/ \
 && chmod 755 /usr/lib/chromium-browser/libwidevinecdm*.so \
 && cd / \
 && rm -fr /build \
 && apt-get purge \
            build-essential \
            cmake \
            curl \
            git \
 && apt-get autoremove

CMD /chromium/run.sh
