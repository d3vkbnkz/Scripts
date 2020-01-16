INTERFACE=$1
PORT=$2

if [ -z "$INTERFACE" ]
then
	echo "INTERFACE required argument is missing."
	exit 1
fi

if [ -z "$PORT" ]
then
	echo "PORT required argument is missing."
	exit 1
fi

sudo sysctl -w net.ipv4.ip_forward=1 > /dev/null
sudo iptables -t nat -A PREROUTING -i $INTERFACE -p tcp --dport 80 -j REDIRECT --to-port $PORT
sudo iptables -t nat -A PREROUTING -i $INTERFACE -p tcp --dport 443 -j REDIRECT --to-port $PORT

echo "[+] Completed successfully."

