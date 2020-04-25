Time machine is only supported for HFS, may work with others, but not worth messing around with.

automounting of drives can be buggy, uses cron tab to allow sufficent time to mount drive on reboot before running time machine.

To inspect time machine logs on mac can use:

``` log stream --style syslog  --predicate 'senderImagePath contains[cd] "TimeMachine"' --info ```

# TODO
* Allow set up of multiple users
* Could port forward on random port to free up samba port for other services 

# Set up HDD
Largely based on [this guide](https://gregology.net/2018/09/raspberry-pi-time-machine) 
```
sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
sudo apt install hfsutils hfsprogs
sudo mkfs.hfsplus /dev/<YOUR-DEVICE> -v TimeMachine
sudo mkdir /media/tm && sudo chmod -R 777 /media/tm && sudo chown pi:pi /media/tm
```

# Mount drive (replace UUID)
```
sudo nano /etc/fstab
```

Add a line that looks like:
```
UUID=<YOUR-UUID> /media/tm hfsplus force,rw,user,noauto 0 0
sudo mount /media/tm
```


```
sudo crontab -e
```

Add the following line for automount / start on startup:
```
@reboot sleep 30 && mount /media/tm && sleep 30 && umount /media/tm && sleep 30 && mount /media/tm && sleep 30 && docker run -d --net=host \
            -v /media/tm:/timemachine/ \
            -e TM_USER=<USER>\
            -e TM_PW=<PASSWORD> \
            -e TM_SIZE=490000 \
            --name=timemachine samba-timemachine:latest
```

# Set up container
```
git clone https://github.com/willtho89/docker-samba-timemachine.git 
docker build -t samba-timemachine:latest -f Dockerfile .
docker run -d --net=host \
            -v /media/tm:/timemachine/ \
            -e TM_USER=<USER> \
            -e TM_PW=<PASSWORD> \
            -e TM_SIZE=490000 \
            --name=timemachine samba-timemachine:latest
```

Then just connect to ```smb://<PI-IP>``` on mac and configure.

(can use ```hostname -I``` for PI-IP)