#/bin/bash

### System update
sudo dnf -y update
sudo dnf -y autoremove

### VPN for Fedora
sudo dnf -y install openvpn openfortivpn NetworkManager-fortisslvpn NetworkManager-fortisslvpn-gnome

### Setup for the power battery management
sudo dnf -y install tlp tlp-rdw
sudo systemctl enable tlp.service
sudo systemctl restart tlp

### USB bootable application
sudo dnf -y install liveusb-creator

### Editor, compilers and debugger
sudo dnf -y install vim
sudo dnf -y install gcc-c++ gcc-fortran
sudo dnf -y install cmake automake libtool
sudo dnf -y install htop make
sudo dnf -y install gdb

### Development tools (parser generator, memory leak, token tracker)
sudo dnf -y install bison valgrind valgrind-devel flex

### Flatpak to install visual studio code and image
sudo dnf -y install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak -y install flathub com.visualstudio.code
sudo flatpak install flathub org.inkscape.Inkscape
sudo flatpak install flathub org.gimp.GIMP

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

### For science applications
sudo dnf -y install eigen3-devel
sudo dnf -y install freecad
sudo dnf -y install libtirpc-devel
sudo dnf -y install boost-devel gmp-devel mpfr-devel
sudo dnf -y install micro

### Generating a ssh key
ssh-keygen -t rsa

