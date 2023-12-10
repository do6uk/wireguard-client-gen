#!/bin/bash
if [ -z "$1" ]; then
  read -p "Clientname: " CLIENT
else
  CLIENT=$1
fi
if [ -z "$2" ]; then
  read -p "IP Endziffer: " IP
else
  IP=$2
fi

while true; do
read -p "Client $CLIENT @ $IP erzeugen und einbinden? (j/n) " yn
case $yn in 
	[jJ] ) break;;
	[nN] ) echo "ABBRUCH ...";
		exit;;
	* ) echo "fehlerhafte Eingabe";;
esac
done

echo -e "erzeuge Schlüsselpaar für $CLIENT @ IP $IP ... \n"
wg genkey | tee clients/$CLIENT-private.key | wg pubkey > clients/$CLIENT-public.key
PRIVATE=`cat clients/$CLIENT-private.key`
PUBLIC=`cat clients/$CLIENT-public.key`
NOW=`date +%Y-%m-%d-%H-%M`

echo -e "erzeuge Client-Datei ... \n"
sed "s#*CLIENT#$CLIENT#g;s#*PRIVATEKEY#$PRIVATE#g;s#*IP#$IP#g;s#*NOW#$NOW#g" new_client.conf > clients/$CLIENT-client.conf

echo -e "erzeuge Peer & ergänze Server-Konfig ... \n"
sed "s#*CLIENT#$CLIENT#g;s#*PUBLICKEY#$PUBLIC#g;s#*IP#$IP#g;s#*NOW#$NOW#g" new_peer.conf >> wg0.conf

echo -e "kontrolliere Server Konfig ... \n"
less wg0.conf

echo -e "Client Konfig ... \n"
less clients/$CLIENT-client.conf

echo -e "erzeuge QR-Code ... \n"
qrencode -t ansiutf8 < clients/$CLIENT-client.conf

echo -e "\n ... denke daran den Service neu zu starten ;-) \n"
