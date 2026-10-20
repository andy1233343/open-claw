FROM cloudflare/cloudflared:latest AS cloudflared
FROM ghcr.io/sagernet/sing-box:latest
COPY --from=cloudflared /usr/local/bin/cloudflared /usr/local/bin/cloudflared
COPY config.json /etc/sing-box/config.json
COPY start.sh /start.sh
EXPOSE 8080
ENTRYPOINT ["/bin/sh", "/start.sh"]
