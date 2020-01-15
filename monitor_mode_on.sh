INTERFACE=$1
if [ -z "$INTERFACE" ]
then
        echo "INTERFACE required argument is missing."
        exit 1
fi

sudo ifconfig $INTERFACE down
sudo iw $INTERFACE set monitor control
# sudo ifconfig $INTERFACE up
echo "[+] Completed successfully...Exiting."

