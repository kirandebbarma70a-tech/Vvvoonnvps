#!/bin/bash

# आपका असली Cloudflare Tunnel Token
CF_TOKEN="eyJhIjoiNTc2NTBjMjcxMmNmMjhjMGJlNjMyMzY1NGI1MTNhMmUiLCJ0IjoiOTc0ZjVhYWMtNzI5MS00ZjE3LWI2NTItY2I1M2Q2MDdlNjBiIiwicyI6Ik1HVTFZMkZpTkdNdE1EbGxOeTAwTlRCbUxXRXhNVE10WkRKbVptSmpaV0psWWpGaCJ9"

# रूट पासवर्ड सेट करें
echo "root:root" | chpasswd

echo "Starting Web Dashboard on port 80..."
cd /app
python3 -m http.server 80 &

echo "Starting Cloudflare Tunnel..."
cloudflared tunnel run --token $CF_TOKEN
