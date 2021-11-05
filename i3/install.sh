#                             __       __  
#                ____  ____ _/ /______/ /_ 
#               / __ \/ __ `/ __/ ___/ __ \
#              / /_/ / /_/ / /_/ /__/ / / /
#             / .___/\__,_/\__/\___/_/ /_/ 
#            /_/                           
#
# 			creator : patch
# 			more infos : https://github.com/patchint/patchint_dotfiles
# 			based on : https://github.com/plunne/plunne_dotfiles
# 			for everything working, please use archlinux
#

clean() {
	rm -rf ~/Makefile
	rm -rf ~/install.sh
}

countdown3() {
	echo "3" && sleep 1
	echo "2" && sleep 1
	echo "1" && sleep 1
}

###############
#    Trizen   #
###############

install_trizen() {
	echo -e "\n***** INSTALL TRIZEN *****\n"
	countdown3
	pacman -Sy
	git clone https://aur.archlinux.org/trizen.git
	cd trizen
	makepkg -si
	cd ..
}

################
#     Apps     #
################

install_apps() {
	echo -e "\n***** INSTALL APPS *****\n"
	countdown3
	make all
}

###############
#     ZSH     #
###############

install_zsh() {
	echo -e "\n***** INSTALL ZSH *****\n"
	countdown3
	sudo pacman -S zsh
	echo -e "\n[zsh default]"
	chsh -s /bin/zsh $USER
	DOTS_PATH=$PWD
	cd ~
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	cd $DOTS_PATH
}

#################
#     Miscs     #
#################

misc_fnkeys() {
	echo -e "\n***** MISC FN KEYS *****"
	countdown3
	sudo sh -c "echo options hid_apple fnmode=2 > /etc/modprobe.d/hid_apple.conf"
	sudo sh -c "sed -i 's/FILES=()/FILES=(\/etc\/modprobe.d\/hid_apple.conf)/g' /etc/mkinitcpio.conf"
	sudo mkinitcpio -p linux
}

####################
#     Dotfiles     #
####################

install_dotfiles() {
	echo -e "\n***** INSTALL DOTS *****\n"
	countdown3
	cp -rvpf . ~
	clean
	echo "dotfiles are copied"
    cd ~
    mkdir Documents Music Pictures Projects Videos
}

################
#     MAIN     #
################

echo "*************************"
echo "*     START INSTALL     *"
echo "*************************"

install_trizen
install_apps
install_zsh
install_dotfiles
misc_fnkeys

echo "****************************"
echo "*     INSTALL FINISHED     *"
echo "****************************"

echo -e "\n/!\\ SYSTEM WILL REBOOT /!\\"
countdown3
reboot
