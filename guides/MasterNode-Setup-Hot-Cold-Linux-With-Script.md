# Adultchain Masternode Installation using Script

> This guide is meant for setting up a HOT/COLD SETUP WITH WINDOWS AND LINUX. 

Use this script on a fresh install of Ubuntu 16.04

# Part 1 - Sending Collateral Coins

1. Open your Windows wallet - MAKE SURE IT IS SYNCED WITH THE NETWORK
2. Go to Tools -> Debug Console
3. Type: getaccountaddress MN# (# is your masternode number you want to use)
4. Send 20000 XXX to this address
5. Go to Tools -> Debug Console
6. Type: masternode outputs (This can take a minute before an output is shown)
7. Type: masternode genkey
7. Save your TX ID (The first number) and your Index Number (Second number, either a 1 or 0)
8. Save your generated key as well as this will be needed in your VPS
9. Save these with a notepad
10. Close the wallet
11. Move to Part 2 for now

# Part 2 - Getting your Linux VPS Started Up (Read all instructions and follow prompts closely)

Connect to your linux VPS. Copy and paste the following, one at a time, to get started:

Download the script:

`sudo wget https://raw.githubusercontent.com/AdultChain/Installation-guides/master/scripts/adultconfig.sh`

Make the script executable:

`sudo chmod +x adultconfig.sh`

Execute the script and follow the instructions:

`sudo ./adultconfig.sh`


# Part 3 - Editing your Windows Config File

1. Open your wallet
2. Go to Tools -> Open Masternode Configuration File
3. Enter the following on one single line after the example configuration

`<alias> <ip>:6969 <private_key> <tx_id> <index>`

4. It should look something like this:
 
`MN1 66.65.43.32:6969 87dfjnKNfdjNlwomdmKKMdkaNIE a3eofJJkdlMlfKokfmalmofO 0`

5. Save and close the file and restart your wallet.

# Part 4 - Starting the Masternode

1. In your wallet, go to Masternodes
2. Right-click your masternode and click "Start alias"
3. Enjoy!  You can start this process over again for another MN on a fresh Linux VPS!

