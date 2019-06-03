# Bootstrap Usage instructions
----
## What is a bootstrap file?
A bootstrap file, typically named `bootstrap.dat` is a file in which all the blocks in a blockchain are contained. Usually up until a very recent time. (i.e. Yesterday)

## What is a bootstrap file good for?
When a new wallet has been installed, it does not have any information about the current state of the blockchain yet. 
To be able to function properly it needs to synchronize with the blockchain. It will do so by downloading the blocks one by one which can can take many hours to complete.

To speed this synchronization process up, you can use a bootstrap.dat file.
(!) We switched from using a bootstrap.dat to an other approach where we create a `.zip`-archive with a *snapshot* of the current state of the blockchain already processed by a wallet. 
Not only including the blocks, but the chainstate and peers list as well. This speeds up the synchronization tremendously!

----
## Usage
1. If this is a new wallet, you need to start the wallet at least once to create the installation folder. 
2. Download the latest [xxx-blockchain-latest.zip from here](https://www.dropbox.com/s/hrc9r8bn8vpo2yn/xxx-blockchain-latest.zip?dl=1)
3. Stop your wallet (File/Quit on the QT wallet or `adultchain-cli stop` if you are using the daemon) 
4. Go to your installation folder (`%appdata%\Adultchain` if you are using Windows, or `/root/.adultchain` or `/home/$USER/.adultchain` on Linux) and remove the following:
 - blocks folder
 - chainstate folder
 - peers.dat file

Linux command line:
```bash
cd /root/.adultchain # or whereever your installation folder is
sudo rm blocks chainstate -r && sudo rm peers.dat
```

5. Unzip `xxx-blockchain-latest.zip` to your installation folder, you should get the file and folders you just deleted. 

Linux command line:
```bash
sudo unzip xxx-blockchain-latest.zip
```

6. Restart your wallet

Linux command line:
```bash
adultchain-cli stop
# wait a bit for the daemon to properly stop before starting again ...
adultchaind
```

----
## Contact and questions
If you have trouble using the bootstrap, join us on our [discord](https://discord.gg/cQ84HeJ) to get help from one of our members.
