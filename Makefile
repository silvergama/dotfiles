.PHONY: install

# Configuration
user-nick = $(USER)
VIM_PATH = ~/.vim
VIM_PLUGINS_PATH = $(VIM_PATH)/pack/plugins/start
VIM_THEMES_PATH = $(VIM_PATH)/pack/themes/start

install: vim/clean
	sh bootstrap.sh -f
	sh brew.sh
	$(MAKE) vim/plugins
	$(MAKE) vim/themes

vim/clean: 
	rm -rf $(VIM_PATH)/pack
	rm -rf $(VIM_PATH)/backups
	mkdir -p $(VIM_PATH)/backups $(VIM_PLUGINS_PATH) $(VIM_THEMES_PATH) 
	
vim/plugins:
	cd $(VIM_PLUGINS_PATH) \
		&& git clone https://github.com/vim-airline/vim-airline.git \
		&& git clone https://github.com/vim-syntastic/syntastic.git \
		&& git clone https://github.com/fatih/vim-go.git \
		&& git clone https://github.com/tpope/vim-vinegar.git \
		&& git clone https://tpope.io/vim/fugitive.git \
		&& git clone https://github.com/junegunn/fzf.vim.git \
		&& git clone --depth 1 https://github.com/dense-analysis/ale.git /
		&& git clone https://github.com/iamcco/markdown-preview.vim.git

vim/themes:
	cd $(VIM_THEMES_PATH) \
		&& git clone https://github.com/vim-airline/vim-airline-themes.git \
		&& git clone https://github.com/lifepillar/vim-solarized8.git 
