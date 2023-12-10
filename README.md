# wireguard-client-gen

## install

`apt install qrencode` install qrencode if you want to generate qrcode in cli / if not wanted comment the line in `new-client.sh`

`cp new* /etc/wireguard` copy new*-Files to your wireguard-config-directory (e.g. /etc/wirequard)

`cd /etc/wireguard` change directory

`mkdir clients` create subdirectory to store client-files

`chmod a+x new-client.sh` to make file executable

**Use your favorite editor to change your defaults in the following files ...**

`new_peer.conf` > change first octets to fit your ip-range

`new_client.conf` > enter ip-address & public-key of your endpoint / change first octets to fit your ip-range / change or disable DNS

`wg0.conf` is given as example and for testing the script

## usage

`./new-client.sh` without any parameter will ask for *Clientname* and *IP-Part* (last octet)

`./new-client.sh {clientname} {ip-part}` will generate without asking

The script will display the *-client.conf and your modified wg0.conf
At last step it will generate an qr-code with client-config
