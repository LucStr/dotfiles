install: packages yay aur zsh
	echo 'Starting Installation'

packages:  
	sudo pacman -Sy --needed - < default_packages.txt

yay:
	sudo rm -rf yay-git
	sudo git clone https://aur.archlinux.org/yay-git.git
	sudo chown -R $$USER\:$$USER yay-git
	cd yay-git; \
	makepkg -si
	rm -rf yay-git

aur: yay
	yay -S --needed - < default_aur_packages.txt

zsh:
	echo 'Installing Zsh'

