FROM alpine:3.20
RUN apk add --no-cache curl unzip ca-certificates && \
    curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.11.9/Xray-linux-64.zip && \
    mkdir -p /app/xray && unzip -q /tmp/xray.zip -d /app/xray && \
    chmod +x /app/xray/xray && rm /tmp/xray.zip
COPY config.template.json /app/config.template.json
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
