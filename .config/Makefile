install: packages yay aur zsh
	echo 'Starting Installation'

packages:  
	sudo pacman -S --needed - < default_packages.txt

yay:
	sudo git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -siy
	cd ..
	rm -rf yay-git

aur: yay
	yay -S --needed - < default_aur_packages.txt

zsh:
	echo 'Installing Zsh'
