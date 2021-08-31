.PHONY: install
.PHONY: source

# Configuration
user-nick = $(USER)
VIM_PATH = ~/.vim

install: vim/clean
	@make source
	@make for_all_os

for/linux:
	bash for_linux.sh

for/macos:
	bash for_macos.sh

for_all_os:
	bash for_all_os.sh

source:
	bash bootstrap.sh -f

vim/clean: 
	rm -rf $(VIM_PATH)/backups
	mkdir -p $(VIM_PATH)/backups 
