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

########################
#     APPLICATIONS     #
########################

# Main Apps
Terminal = rxvt-unicode
Editor = neovim-nightly-bin python-pip nodejs npm gvim
Browser = firefox
FileManager = ranger ueberzug $(Thunar)
Thunar = thunar thunar-archive-plugin thunar-media-tags-plugin thunar-shares-plugin thunar-volman tumbler ffmpegthumbnailer
Archiver = file-roller
PdfViewer = zathura zathura-pdf-poppler qpdfview
VideoViewer = celluloid
Screenshot = flameshot dbus
Login = lightdm lightdm-webkit2-greeter lightdm-webkit-theme-litarvan

# System
Sysinfos = neofetch
Sysmonitor = htop bashtop

# WM
Bar = polybar
Compositor = picom-ibhagwan-git
Launcher = rofi
Wallpaper = feh
Notifier = dunst

# Xorg
Gpu = xf86-video-amdgpu amd-ucode intel-ucode
Xorg = xorg-server xorg-xinit xorg-xrandr xsel 
X11 = $(Gpu) $(Xorg)

# Audio
Audio = pulseaudio pavucontrol

# Archives
Archives = gzip zip unzip unrar

# Fileypes
Filetypes = gvfs exfat-utils ntfs-3g udiskie

# Network
Network = net-tools network-manager-applet blueman

# Office
Office = libreoffice-still

# Graphism
Graphism = krita gimp

# Dev
DEV = visual-studio-code-bin


#####################
#     VARIABLES     #
#####################

MAIN_APPS = $(Terminal) $(Editor) $(Browser) $(FileManager) $(Archiver) $(PdfViewer) $(VideoViewer) $(Screenshot) 
SYSTEM = $(Sysinfos) $(Sysmonitor)
WM = $(Bar) $(Compositor) $(Launcher) $(Wallpaper) $(Notifier) $(Login)
XORG = $(Gpu) $(Xorg) $(X11)
MISC = $(Audio) $(Archives) $(Filetypes) $(Network) $(Office)

# Set your misc apps
APPS = discord betterdiscord betterdiscordctl telegram-desktop gnupg steam lutris lxappearance clipit $(DEV)

# All packages to install
ALL = $(MAIN_APPS) $(SYSTEM) $(WM) $(XORG) $(MISC) $(APPS)


########################
#     INSTALLATION     #
########################

all: update install other

.PHONY: update install

update:
	trizen -Syy

install:
	trizen -S $(ALL)


#################
#     OTHER     #
#################

others: wm ranger

systemctl enable lightdm
sudo cp lightdm/* /etc/lightdm
sudo cp .wallpaper/* /usr/share/backgrounds



##################
#     RANGER     #
##################

ranger:
	git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons


