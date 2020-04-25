sudo sed -i "s/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/g" -i /etc/locale.gen
sudo locale-gen en_GB.UTF-8
sudo update-locale en_GB.UTF-8

export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

sudo apt-get update && sudo apt-get upgrade -y

sudo sed -i "s/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/g" -i /etc/locale.gen
sudo locale-gen en_GB.UTF-8
sudo update-locale en_GB.UTF-8

export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

sudo apt-get install zsh -y

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

zsh