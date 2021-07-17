call plug#begin('~/.vim/plugged')

" Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-vinegar'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'godoctor/godoctor.vim'
Plug 'buoto/gotests-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'

" Themes
Plug 'sainnhe/sonokai'
Plug 'fatih/molokai'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'

call plug#end()
