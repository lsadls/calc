#!/bin/sh
wget -O /tmp/trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/latest/download/trojan-go-linux-amd64.zip
unzip /tmp/trojan-go.zip -d /tmp
mv /tmp/trojan-go /root/calc
rm -r /tmp/*
chmod 0755 /root/calc

cat << EOF > /root/server.yaml
run-type: server
local-addr: 0.0.0.0
local-port: 8080
remote-addr: example.com
remote-port: 80
log-level: 2
password:
    - $PASSWORD
websocket:
    enabled: true
    path: /$WS_PATH
    host: example.com
transport-plugin:
    enabled: true
    type: plaintext
EOF

cat /root/server.yaml
/root/calc -config /root/server.yaml
