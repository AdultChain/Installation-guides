#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*      XXX Masternode         *"
echo "*          SETUP              *"
echo "*           BY                *"
echo "*          TPOT               *"
echo "*                             *"
echo "*                             *"
echo "*******************************"
echo ""
echo && echo && echo

echo "Please enter the IP Address of your server (WITHOUT PORT): "
read IP
echo "Please enter the TX ID you got from your Windows Wallet: (Shift+Insert on Putty to paste)"
read TX
echo "Please enter the Index number you got from your Windows Wallet (0 or a 1): "
read INDEX
echo "Please enter a name for your masternode: "
read ALIAS
echo "Please enter your private key: (Shift+Insert on Putty to paste)" 
read KEY

sleep 1

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wget nano unrar unzip -y
sudo apt-get install libboost-all-dev libevent-dev software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
  
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
sudo free
sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw allow 6969/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sleep 1
sudo mv /$USER/adultmnsetup/adultchaind /$USER
sudo mv /$USER/adultmnsetup/adultchain-cli /$USER
sleep 1
cd /$USER
sleep 1
sudo chmod +x /$USER/adultchaind /$USER/adultchain-cli
sleep 1
sudo /$USER/adultchaind
sleep 1
echo "We are now changing the config file and masternode file"
echo ""
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> /$USER/.adultchain/adultchain.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> /$USER/.adultchain/adultchain.conf
echo "rpcallowip=127.0.0.1" >> /$USER/.adultchain/adultchain.conf
echo "listen=1" >> /$USER/.adultchain/adultchain.conf
echo "server=1" >> /$USER/.adultchain/adultchain.conf
echo "daemon=1" >> /$USER/.adultchain/adultchain.conf
echo "maxconnections=250" >> /$USER/.adultchain/adultchain.conf
echo "masternode=1" >> /$USER/.adultchain/adultchain.conf
echo "masternodeaddr=$IP:6969" >> /$USER/.adultchain/adultchain.conf
echo "externalip=$IP:6969" >> /$USER/.adultchain/adultchain.conf
echo "masternodeprivkey=$KEY" >> /$USER/.adultchain/adultchain.conf
echo "" >> /$USER/.adultchain/adultchain.conf
echo ""
echo "Config file has been updated, you can see it at nano .adultchain/adultchain.conf"
sleep 2
echo ""
echo "Updating the masternode.conf file now"
sleep 1
echo "$ALIAS $IP:6969 $KEY $TX $INDEX" >> /$USER/.adultchain/masternode.conf
sleep 1
echo "Starting the daemon again as a masternode"
sudo /$USER/adultchaind
sleep 1
echo ""
cd /$USER
echo "Please wait for the node to sync with the network"
