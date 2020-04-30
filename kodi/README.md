Very simple setup compared to Timemachine...

### Install
```
$ sudo apt install kodi
```

### Config options
Update raspi-config according to [this guide](https://www.raspberrypi.org/forums/viewtopic.php?t=251645):

"raspi-config" -> "Advanced Options" -> "Memory Split" -> 320MB 

to start kodi automatically on boot:

configure to start on console...
"raspi-config" -> boot-options -> desktop/cli -> "Console Autologin"

update cron to start Kodi on boot
```sudo crontab -e```

add a line: ```@reboot kodi --standalone```

### To Do
* Could in theory looking at conatiner options but can't really see the need with set up being so easy...
