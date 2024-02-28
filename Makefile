.PHONY: install
.PHONY: source

# Configuration
user-nick = $(USER)
VIM_PATH = ~/.vim

install: vim/clean
	@make for_all_os
	@make source

for/linux:
	zsh for_linux.sh

for/macos: install
	zsh for_macos.sh

for_all_os:
	zsh for_all_os.sh

source:
	zsh bootstrap.sh

vim/clean: 
	rm -rf $(VIM_PATH)/backups
	mkdir -p $(VIM_PATH)/backups 
