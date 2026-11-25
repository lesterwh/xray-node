#!/bin/sh
set -e
: "${UUID:?UUID env required}"
WSPATH="${WSPATH:-/ws}"
PORT="${PORT:-8080}"
sed -e "s|__UUID__|${UUID}|g" -e "s|__PORT__|${PORT}|g" -e "s|__WSPATH__|${WSPATH}|g" /app/config.template.json > /app/config.json
exec /app/xray/xray run -config /app/config.json
