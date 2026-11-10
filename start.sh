#!/bin/bash

# आपका असली Cloudflare Tunnel Token
CF_TOKEN="eyJhIjoiNTc2NTBjMjcxMmNmMjhjMGJlNjMyMzY1NGI1MTNhMmUiLCJ0IjoiNmVkZjY0NmQtNTM4OC00MTFiLWJlMjEtMjgyOTBlNDFjYTJjIiwicyI6IlpUVXhaVEpqWVdNdFltVmlNeTAwWXpRM0xXSm1OVFF0TVRjeVpqVTBOR1ppTjJWbCJ9"

# रूट पासवर्ड सेट करें
echo "root:root" | chpasswd

echo "Starting Web Dashboard on port 80..."
cd /app
python3 -m http.server 80 &

echo "Starting Cloudflare Tunnel..."
cloudflared tunnel run --token $CF_TOKEN
