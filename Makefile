.PHONY: install
.PHONY: source

# Configuration
user-nick = $(USER)
VIM_PATH = ~/.vim

install: vim/clean
	@make curl-command
	@make source

curl-command:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

shell-command:
	bash brew.sh

source:
	bash bootstrap.sh -f

onlinux: 
	sh install.sh

vim/clean: 
	rm -rf $(VIM_PATH)/backups
	mkdir -p $(VIM_PATH)/backups 
