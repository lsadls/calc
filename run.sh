#!/bin/sh
wget -O /tmp/file.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/file.zip -d /tmp
mv /tmp/v2ray /root/calc
rm -r /tmp/*
chmod 0755 /root/calc

cat << EOF > /root/config.json
{
  "inbounds": [
    {
      "port": 8080,
      "listen":"127.0.0.1",
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "$PASSWORD"
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "$WS_PATH"
        }
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

/root/calc
