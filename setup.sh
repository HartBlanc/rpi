# fix locale bugs
export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

sudo sed -i "s/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/g" -i /etc/locale.gen
sudo locale-gen en_GB.UTF-8
sudo update-locale en_GB.UTF-8

# update packages
sudo apt update && sudo apt full-upgrade -y --fix-missing

# set up vim
cp .vimrc ~/.vimrc
cp .p10k.zsh ~/.p10k.zsh

# install zsh + themes
sudo apt-get install zsh -y
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
echo 'export LANGUAGE=en_GB.UTF-8' >>! ~/.zshrc
echo 'export LANG=en_GB.UTF-8' >>! ~/.zshrc
echo 'export LC_ALL=en_GB.UTF-8' >>! ~/.zshrc
chsh -s $(which zsh) 
zsh

# get docker and set user group 
sudo curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker pi
