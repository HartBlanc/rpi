# Useful Resources
[Apple Support - Advice on formatting drives for TM](https://support.apple.com/en-gb/HT202784#nas) (Drive should be MacOS journaled)
[Samba Wiki - Configure Samba to Work better with SMB](https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X)
[Alex Lubbock's - HOWTO this is based on](https://alexlubbock.com/time-machine-network-backup-linux)
[docker-avahi repo](https://github.com/solidnerd/docker-avahi)
[docker-samba repo (includes timemachine config)](https://github.com/dperson/samba)

To inspect time machine logs on mac can use:
``` log stream --style syslog  --predicate 'senderImagePath contains[cd] "TimeMachine"' --info ```

# TODO
* Allow set up of multiple users
* Could port forward on random port to free up samba port for other services 

# Set up HDD
Largely based on [this guide](https://gregology.net/2018/09/raspberry-pi-time-machine) 
```
$ sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
$ sudo apt install hfsutils hfsprogs
$ sudo mkfs.hfsplus /dev/<YOUR-DEVICE> -v TimeMachine
$ sudo mkdir /media/tm && sudo chmod -R 777 /media/tm && sudo chown pi:pi /media/tm
```

# Mount drive (replace UUID)
```
$ sudo nano /etc/fstab
```

Add a line that looks like:
```
UUID=<YOUR-UUID> /media/tm hfsplus defaults,auto,users,rw,nofail 0 0
```
then
```
$ sudo mount /media/tm
$ sudo docker-compose up -d
```
