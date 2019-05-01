This is a HowTo Guide on "hand compiling" the AdultChain ("XXX") wallet code on Ubuntu 16.04LTS.

**Recommendations**
- The Ubuntu 16.04LTS system is patched and up to date prior to starting this process.
- The system has a minimum of 4GB of RAM and 2GB of swap space.

**Dependency Build Instructions: Ubuntu & Debian***

Build requirements:
```
sudo apt-get install build-essential libtool autotools-dev autoconf pkg-config libssl-dev
sudo apt-get install libboost-all-dev
```
db4.8 packages are available here. You can add the repository using the following command:
```
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev
```

Optional:
```
sudo apt-get install libminiupnpc-dev (see --with-miniupnpc and --enable-upnp-default)
```
**Dependencies for the GUI: Ubuntu & Debian**

If you want to build `adultchain-qt`, make sure that the required packages for Qt development are installed. Qt 5 is necessary to build the GUI. If both Qt 4 and Qt 5 are installed, Qt 5 will be used. To build without GUI pass --without-gui.

For Qt 5 you need the following:
```
sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
```
libqrencode (optional) can be installed with:
```
sudo apt-get install libqrencode-dev
```
Once these are installed, they will be found by configure and a adultchain-qt executable will be built by default.



**Hand Compiling Process**

As `root` (preferred) perform the following steps:
```
git clone https://github.com/AdultChain/AdultChain.git 
cd Adulthchain
./autogen.sh
./configure
make
make install
```

This will produce the following files:
```
Adulchain/src/adultchaind
Adulchain/src/adultchain-cli
```
and if you have QT libraries installed and configured this will produce
```
Adultchain/src/qt/adultchain-qt
```