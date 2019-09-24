#/bin/bash

echo "*******************************"
echo "*                             *"
echo "*          Adultchain         *"
echo "*          Masternode         *"
echo "*            SETUP            *"
echo "*                             *"
echo "*******************************"
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!                                                 !"
echo "! Make sure you double check before hitting enter !"
echo "!                                                 !"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo && echo && echo

# Read user informations
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
sleep 2
clear

# Update system and install dependancies
echo ""
echo "Updating system and installing dependancies"
echo ""
sleep 2
add-apt-repository ppa:bitcoin/bitcoin -y
apt-get update -y
apt-get dist-upgrade -y
apt-get install ufw unzip libboost-all-dev libevent-dev software-properties-common libminiupnpc-dev -y
apt-get install libdb4.8-dev libdb4.8++-dev -y
clear

# Create 2GB swap file
echo ""
echo "Creating swap file"
echo ""
sleep 2
cd /var
touch swap.img
chmod 600 swap.img
dd if=/dev/zero of=/var/swap.img bs=1024k count=2048
mkswap /var/swap.img
swapon /var/swap.img
echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
cd

# Configure ufw for SSH and daemon
echo ""
echo "Configuring firewall"
echo ""
sleep 2
ufw allow ssh/tcp
ufw limit ssh/tcp
ufw allow 6969/tcp
ufw logging on
echo "y" | ufw enable

# Install daemon and bootstrap
echo ""
echo "Installing daemon and bootstrap file"
echo ""
sleep 2
wget https://github.com/zoldur/AdultChain/releases/download/v1.2.2.0/adultchain.tar.gz
tar xzvf adultchain.tar.gz
mv adultchaind adultchain-cli /usr/local/bin
rm adultchain.tar.gz
mkdir .adultchain && cd .adultchain
wget https://www.dropbox.com/s/hrc9r8bn8vpo2yn/xxx-blockchain-latest.zip?dl=1
unzip xxx-blockchain-latest.zip?dl=1
rm xxx-blockchain-latest.zip?dl=1

# Create config file
echo ""
echo "We are now changing the config file"
sleep 2
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

echo ""
echo "Config file has been updated, you can see it with to following command: nano .adultchain/adultchain.conf"
echo ""
sleep 2
echo "Starting the daemon"
echo ""
adultchaind
echo ""
echo "Daemon started"
sleep 2

cd
echo ""
echo "You need to put the following line line in your masternode.conf on your cold wallet"
echo "$ALIAS $IP:6969 $KEY $TX $INDEX"
echo ""
echo ""
echo "Please wait for the node to sync with the network before you start it from your cold wallet"
echo ""
echo ""
echo "Installation completed"
echo ""
sleep 2