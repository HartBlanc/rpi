# Useful Resources
* Note that despite [Apple's Support Docs](https://support.apple.com/en-gb/HT202784#nas) Drive should not be hfs+, hfs+ journaled does not have a write support on linux and journaling is a requirement. ext4 is used in this guide.
* [Samba Wiki - Configure Samba to Work better with SMB](https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X)
* [KervyN's excellent Reddit HowTo](https://www.reddit.com/r/homelab/comments/83vkaz/howto_make_time_machine_backups_on_a_samba/?utm_source=share&utm_medium=web2x)
* [docker-samba repo (includes timemachine config)](https://github.com/dperson/samba)

To inspect time machine logs on mac can use:
```
 log stream --style syslog  --predicate 'senderImagePath contains[cd] "TimeMachine"' --info
```

# Set up HDD
```
$ sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
$ sudo mkfs.ext4 /dev/sda4
$ sudo mkdir /media/tm && sudo chmod -R 777 /media/tm && sudo chown pi:pi /media/tm
$ sudo mount /dev/sda4 /media/tm
```

# Configure avahi
```
sudo mv timemachine.service /etc/avahi/services/
```
# Set up users
create a users.csv file with user,password,quota on each row (quota in GB)

```
export BACKUP_VOLUME=/media/tm
$ python setup.py
$ sudo chmod -R 777 /media/tm
```
# Run
```
$ sudo docker-compose up -d
```

Time machine is running, can now access on mac devices.

### To Do
* quotas not working
* setup /etc/fstab
