# Set Up Pi
sudo raspi-config
sudo apt-get update && sudo apt-get upgrade -y

# Get IP and disk details
sudo lsblk -o UUID,NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL,MODEL
hostname -I

# https://gregology.net/2018/09/raspberry-pi-time-machine/#
# Format Drive + Set Permissions (dev/sda2 mounting to /media/tm)
sudo apt-get install hfsutils hfsprogs
sudo mkfs.hfsplus /dev/sda2 -v TimeMachine
sudo mkdir /media/tm && sudo chmod -R 777 /media/tm && sudo chown pi:pi /media/tm

# Mount drive (replace UUID)
ls -lha /dev/disk/by-uuid
sudo nano /etc/fstab
UUID=6525d832-1a97-35a5-92a4-345253fcfd00 /media/tm hfsplus force,rw,user,noauto 0 0
sudo mount /media/tm

# https://docs.docker.com/engine/install/debian
# Install docker
sudo curl -fsSL https://get.docker.com| sh
sudo usermod -aG docker pi
exit

# https://github.com/odarriba/docker-timemachine
# Set up container
sudo apt-get git
git clone https://github.com/odarriba/docker-timemachine.git
docker build -t timemachine-rpi:latest -f Dockerfile .
docker run -h timemachine --name timemachine --restart=unless-stopped -d -v /media/tm:/timemachine -it -p 548:548 -p 636:636 timemachine-rpi
docker exec timemachine add-account callum PASSWORD tm_callum /timemachine/callum [VOL_SIZE_MB]

# Then just connect to afp://192.168.0.23 on mac and go to system prefs / time machine

# Uninstalling Docker / removing containers etc...
sudo apt-get purge docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
docker container ls
docker kill <container-name>
docker rm   <container-name>
