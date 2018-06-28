IPINFO=$(curl -s -m 1 --connect-timeout 1 "ipinfo.io")
IP=$(echo $IPINFO | jq -r ".ip")
CO=$(echo $IPINFO | jq -r ".country")
if [ $IP ]
then
	echo "$CO $IP"
else
	IP2=$(wget -t 2 -T 2 duckduckgo.com/\?q\=whats+my+ip -q -O - | grep  -Eo '[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}')
	if [ $IP2 ]
	then
		echo "$IP2"
	else
		echo "DISCONNECTED"
	fi;
fi;