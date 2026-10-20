FROM ghcr.io/sagernet/sing-box:latest
COPY config.json /etc/sing-box/config.json
EXPOSE 8080
CMD ["sing-box", "run", "-c", "/etc/sing-box/config.json"]
