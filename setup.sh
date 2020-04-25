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
chsh -s /bin/zsh

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

curl -fsSL https://raw.githubusercontent.com/HartBlanc/rpi/master/.zshrc -o .zshrc

zsh
