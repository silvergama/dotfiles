
"*****************************************************************************
"" Plug install packages
"*****************************************************************************

call plug#begin(expand('~/.vim/plugged'))

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
" Plug 'majutsushi/tagbar'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'fatih/molokai'

Plug 'vim-airline/vim-airline-themes'

"Plug 'vim-syntastic/syntastic'

Plug 'tpope/vim-vinegar'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'wakatime/vim-wakatime'

Plug 'jiangmiao/auto-pairs'
Plug 'frazrepo/vim-rainbow'
Plug 'godoctor/godoctor.vim', {'do': ':GoDoctorInstall'}
Plug 'buoto/gotests-vim'
Plug 'maralla/completor.vim'
Plug 'hschne/fzf-git'


if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}


"*****************************************************************************
"*****************************************************************************

call plug#end()