#!/bin/sh
wget -O /tmp/trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/latest/download/trojan-go-linux-amd64.zip
unzip /tmp/trojan-go.zip -d /root
rm -r /tmp/trojan-go.zip /root/example /root/geoip.dat
chmod 0755 /root/trojan-go
mv /root/trojan-go /root/calc

cat << EOF > /root/server.yaml
run-type: server
local-addr: 0.0.0.0
local-port: 8080
remote-addr: example.com
remote-port: 80
log-level: 5
password:
    - $PASSWORD
websocket:
    enabled: true
    path: /robots
transport-plugin:
    enabled: true
    type: plaintext
router:
  enabled: true
  block:
    - 'geoip:private'
    - 'geosite:category-ads'
  geoip: /root/geoip-only-cn-private.dat
  geosite: /root/geosite.dat
EOF

/root/calc -config /root/server.yaml
