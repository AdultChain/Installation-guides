# XXX Windows QT Wallet Install Guide

> This is a community contributed guide. Feel free to suggest improvements via Issues or opening Pull Requests. Thank you!

**!!! This guide is for installing the AdultChain wallet

---

## Requirements
* Windows 7 or higher (This will be your Cold wallet)
* Windows Admin rights
* Basic Windows skills
---

## Wallet Setup using the Qt GUI wallet on Windows

### 1. Install and open the AdultChain-Qt wallet on your machine.

#### i.    Download the newest adultchain-qt.zip wallet from https://github.com/AdultChain/AdultChain/releases
#### ii.   Extract the adultchain-qt.exe from adultchain-qt.zip
#### iii.  Start the new adultchain-qt.exe
#### iv.   Click More Info and then Run Anyway if you get this warning:
![Alt text](../images/xxx-windows-openfile.png "Wallet Open File Warning")
#### v.    If this is the first time you have started the wallet, you will be asked what folder you want to use to store the date. We recommend you use and note the default folder.
![Alt text](../images/xxx-windows-data-directory-box.png "Wallet Data Directory box")
#### vi.   If this is the first time you have started the wallet, you will be asked to Allow Access by the firewall, click Allow access:
![Alt text](../images/xxx-windows-firewall.png "Wallet Windows Firewall Warning")
#### vii.a  Let the wallet sync until you see this symbol (blue check mark) at the bottom right of your wallet main screen
![Alt text](../images/xxx-wallet-sync.png "Wallet fully synched")
#### vii.b (Optional) If you want your wallet to sync faster, you can download and install the blockchain files. Click [here](https://gitlab.com/adultchain-project/development/bootstrap/blob/master/Bootstrap_install_guide.md) to have more informations on that method.
#### viii. Encrypt your wallet with a long passphrase and either save it in a password manager such as keepass, or write it down and keep it safe (in a locked compartment or safe) (recommended). This passphrase is your only key to your wallet, do NOT lose it or you will lose all your XXX. Do not let anyone steal your passcode or wallet either, just like in real life!
To encrypt the wallet, go to Settings > Encrypt wallet. Enter the passphrase, click ok. You will then have to restart the wallet and then go to Settings > Unlock Wallet and then enter the passphrase to unlock the wallet, for staking, controlling the masternode or sending your XXX.
#### ix.   Back up your wallet.dat in case of a mistake as soon as you encrypt your wallet. Once you have encrypted the wallet, your previous backups will not work, so back it up by going to File > Backup Wallet and save the backup to more than one place. Such as a USB key or a network share.
