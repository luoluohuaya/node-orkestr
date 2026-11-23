FROM alpine:3.20

RUN apk add --no-cache curl unzip ca-certificates \
    && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/xray \
    && rm /tmp/xray.zip

COPY config.json start.sh ./
RUN chmod +x start.sh

CMD sh start.sh
