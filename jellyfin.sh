#!/bin/sh
echo '{"pkgs":["libunwind","icu","libinotify","openssl","ca_root_nss","sqlite3","ffmpeg"]}' > /tmp/pkg.json
iocage create -n "jellyfin" -p /tmp/pkg.json -r 12.1-RELEASE ip4_addr="vnet0|192.168.1.5/24" defaultrouter="192.168.1.1" vnet="on" allow_raw_sockets="1" allow_mlock="1" boot="on"
rm /tmp/pkg.json
iocage exec jellyfin ln -s /usr/local/lib/libsqlite3.so /usr/local/lib/libe_sqlite3
