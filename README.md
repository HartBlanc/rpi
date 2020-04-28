# Set up

setup.sh contains a helper script which:
* sets locale to en_GB
* updates packages to latest versions
* sets up dev environment (vim, zsh, docker, docker compose)

make sure you have git (sudo apt install git)
```
git clone https://github.com/HartBlanc/rpi.git
cd rpi && sh +x setup.sh
```

# Ideas

[## Time Machine](./timemachine_over_smb)

* To support samba protocol (AFP discontinued)
* To support multiple users
* Avahi daemon for discoverability
* Conatinerised for isolation / reproducability

## Cloud Storage
* All files on drive should be accesible remotely

## Media Center
* Goal: To be able to watch anything on the TV easily
* Kodi
* Plugins for streaming services
* Plugins for torrenting
* control via standard Remote Control (HDMI-CEC)

## Remote Backup for redundancy
* Reasonable speeds
* limited frequency / number of files
* encrypted in transit and at rest
