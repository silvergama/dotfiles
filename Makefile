.PHONY: install
.PHONY: source

# Configuration
user-nick = $(USER)
VIM_PATH = ~/.vim

install: vim/clean
	@make shell-command
	@make curl-command
	@make source

curl-command:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

shell-command:
	sh brew.sh

source:
	sh bootstrap.sh -f

vim/clean: 
	rm -rf $(VIM_PATH)/backups
	mkdir -p $(VIM_PATH)/backups 
