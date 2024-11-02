# Installation instructions

## Install Ubuntu Server 24.04

Download image here : https://ubuntu.com/download/server

Create ISO Image on USB Stick : 

`sudo dd if=ubuntu-20.04.1-live-server-amd64.iso of=/dev/sda bs=4M status=progress && sync`

Install OS

## On first start

Make this repo public in github

Then clone it : 

```
git clone https://github.com/loicfavory/setup
cd setup
./install.sh
```

Reboot

## Finish bluetooth configuration


Edit the file /etc/bluetooth/main.conf

Uncomment FastConnectable config and set it to true: `FastConnectable = true`

Uncomment `ReconnectAttempts=7` (set the value to whatever number that you want)

Uncomment `ReconnectIntervals=1, 2, 3`


## Secured data

Install pCloud

https://www.pcloud.com/fr/how-to-install-pcloud-drive-linux.html?download=electron-64

Get secured data from backup

Install PHPStorm using JetBrains Toolbox

Reboot