#!/bin/sh

echo calc
cat << EOF | /root/calc | cut -d' ' -f2
{
  "inbounds": [
    {
      "port": 8080,
      "protocol": "trojan",
      "settings": {
        "clients": [
          {
            "id": "a6ed9716-3e21-4ea5-9889-e2cb2c41e4bf"
          }
        ],
        "fallbacks": [
          {
            "dest": "example.com:80"
          }
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF
