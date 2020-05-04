#/bin/bash

### System update
sudo dnf update 
sudo dnf autoremove

### VPN for Fedora
sudo dnf -y install openvpn openfortivpn NetworkManager-fortisslvpn NetworkManager-fortisslvpn-gnome

### Setup for the power battery management
sudo dnf -y install tlp tlp-rdw
sudo systemctl enable tlp.service
sudo systemctl restart tlp

### USB bootable application
sudo dnf install liveusb-creator

### Compilers and editor
sudo dnf -y install vim
sudo dnf -y install gcc-c++ gcc-fortran
sudo dnf -y install cmake automake libtool
sudo dnf -y install htop make

### Fix memory leaks
sudo dnf -y install bison valgrind valgrind-devel flex

### Flatpak 
sudo dnf install flatpak

### Setting Bash colours
if  grep -q "*/.bash-git-prompt/gitprompt.sh" ~/.bashrc ; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
    echo "if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then" >> ~/.bashrc
    echo "    GIT_PROMPT_ONLY_IN_REPO=1" >> ~/.bashrc
    echo "    source $HOME/.bash-git-prompt/gitprompt.sh" >> ~/.bashrc
    echo "fi" >> ~/.bashrc
fi

### Parallel programming 
sudo dnf -y install hdf5-devel openmpi openmpi-devel mpich mpich-devel redhat-rpm-config
# to cover a bug in openmpi in fedora
if [ ! -d "/usr/lib64/openmpi/include" ] ; then
    sudo mkdir /usr/lib64/openmpi/include
fi

### Science programs
sudo dnf -y install eigen3-devel
sudo dnf -y install micro
