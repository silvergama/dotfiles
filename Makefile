.PHONY: install

# Configuration
user-nick = $(USER)
VIM_PATH = ~/.vim
VIM_PLUGINS_PATH = $(VIM_PATH)/pack/plugins/start
VIM_THEMES_PATH = $(VIM_PATH)/pack/themes/start

install: vim/clean
	sh bootstrap.sh -f
	sh brew.sh
	cd $(VIM_PLUGINS_PATH)/vim-prettier && npm install

vim/clean: 
	rm -rf $(VIM_PATH)/backups
	mkdir -p $(VIM_PATH)/backups 
