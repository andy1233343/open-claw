#!/bin/sh
# Argo tunnel sidecar (cloudflared) with self-healing supervisor loop.
# The tunnel token comes from the ARGO_TOKEN environment variable
# (set in Orkestr project/environment settings, never stored in this repo).
if [ -n "$ARGO_TOKEN" ]; then
  ( while true; do cloudflared tunnel --no-autoupdate run --token "$ARGO_TOKEN"; echo "cloudflared exited, restarting in 5s"; sleep 5; done ) &
  echo "cloudflared supervisor started"
else
  echo "ARGO_TOKEN not set, Argo tunnel disabled"
fi
exec sing-box run -c /etc/sing-box/config.json
