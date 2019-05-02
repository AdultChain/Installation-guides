# Bootstrap installation instruction
----
## What is bootstrap?
A bootstrap file, is a file in which all the blocks in a blockchain are contained. Usually up until a very recent time. (i.e. Yesterday)

## What is a bootstrap file good for?
When a new wallet has been installed, it does not have any information about the current state of the blockchain yet.

To be able to function properly it needs to synchronize with the blockchain. It will do so by downloading the blocks one by one.

This process can take up hours.

To speed the synchronization process up, it is possible to use a bootstrap file, which has all the blocks already in it.

----
## Usage
1. If this is a new wallet, you need to start the wallet at least once to create the installation folder. 
2. Download the latest [xxx-blockchain-latest.zip from here](https://www.dropbox.com/s/hrc9r8bn8vpo2yn/xxx-blockchain-latest.zip?dl=1)
3. Stop your wallet (File/Quit on the QT wallet or `adultchain-cli stop` if you are using the daemon) 
4. Go to your installation folder (`%appdata%\Adultchain` if you are using Windows, or `/root/.adultchain` or `/home/$USER/.adultchain` on Linux) and remove the following:
 - blocks folder
 - chainstate folder
 - peers.dat file

5. Unzip xxx-blockchain-latest.zip to your installation folder, you should get the file and folders you just deleted. 

6. Restart your wallet

----
## Contact and question
If you have trouble using the bootstrap, join us on our [discord](https://discord.gg/cQ84HeJ) to get help from one of our members.

> This is a community contributed guide. Feel free to suggest improvements via Issues or opening Pull Requests. Thank you!
