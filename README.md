# wireguard-client-gen

## install

`cp new* /etc/wireguard` copy new*-Files to your wireguard-config-directory (e.g. /etc/wirequard)
`cd /etc/wireguard` change directory
`mkdir clients` create subdirectory to store client-files

Use your favorite editor to change your defaults in ...
`new_peer.conf` > change first octets to fit your ip-range
`new_client.conf` > enter ip-address & public-key of your endpoint / change first octets to fit your ip-range / change or disable DNS
`wg0.conf` is given as example and for testing the script

## usage

