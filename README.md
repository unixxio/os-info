# OS Info
**Last Update**: November 22, 2021

This script should work on any Debian based OS. This also includes Ubuntu. It might even work on other distributions.

**Install CURL first**
```
apt-get install curl -y
```

### Run the installer with the following command
```
bash <( curl -sSL https://raw.githubusercontent.com/unixxio/os-info/main/os-info.sh )
```

**Requirements**
* Execute as root or user with sudo privileges

**What does it show**
* Your logged in username
* Your logged in IP-address
* Your logged in hostname
* Linux distribution
* Linux release
* Linux version
* Kernel version
* Uptime
* Last reboot (if any)
* Memory usage
* Disk usage
* CPU usage

**Tested on**
* Debian 10 Buster
* Debian 11 Bullseye

## Support
Feel free to [buy me a beer](https://paypal.me/sonnymeijer)! ;-)

## DISCLAIMER
This script does not install anything and therefore is safe to use. But still, as always, use at your own risk and always make sure you have backups!
