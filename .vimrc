"========== User Interface Options ==========
set laststatus=2
set ruler
set number
set noerrorbells
set title
"set termguicolors
set background=dark
colorscheme solarized8_high

let g:solarized_termcolors=256
set t_Co=256
set term=xterm-256color

"Text Rendering Options
set fileencoding=utf-8
set encoding=utf-8
syntax enable
set noswapfile
set nobackup
set nowb
set wrap

" Misellaneous
set history=1000
set autoread
set backspace=indent,eol,start  "Allow backspace in insert mode
set hidden
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0
set nolist
set clipboard=unnamed
"set spell

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase


"set ignorecase
set splitright
set splitbelow
set lazyredraw " Avoid lags

"Indentation Options
set autoindent
set expandtab
filetype plugin indent on
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


" ================ Turn off Swap Files ==================
set noswapfile
set nobackup
set nowb

" ==================== Scrolling ========================
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" NOT WORKING: Didnt work when yanked right out of YADR
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Statusbar
set statusline=\ %f\  " Filename
set statusline+=%{fugitive#statusline()} " Git info
set statusline+=%= " Separator
set statusline+=%y " File type
set statusline+=[%{strlen(&fenc)?&fenc:'none'}] " File encoding
set statusline+=[%{&ff}] " File ending
set statusline+=\ %P\ of\ %L\  " Perc. file
set statusline+=(%l\:%c)\ " Line info
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Column ruler
set colorcolumn=120


" ==================== Markdown ========================
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_minlines = 100
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"=================== Golang =========================
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators =1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_contraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode']
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['golint']
let g:go_metalinter_command='golangci-lint'
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = 'camelcase'
let g:go_gopls_staticcheck = 1
let g:go_list_type = 'quickfix'
let g:go_auto_sameids = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup go
  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  
  au FileType go nmap <Leader>d <Plug>(go-def)
  au FileType go nmap <Leader>dp <Plug>(go-def-pop)
  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)
  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>ct <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go nmap <leader>rf :GoReferrers<cr>
  au FileType go imap ;err <ESC>:GoIfErr<CR>
augroup END

" ale
let g:ale_echo_cursor = 1
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_enabled = 1
" let g:ale_linters = {"go": ['golint', 'go build', 'gofmt', 'go vet', 'gopls', 'revive']}
set filetype=html
let g:ale_linters = {
    \ "go": ['golint', 'go build', 'gofmt', 'go vet', 'gopls', 'revive'],
    \"javascript": ['eslint']
    \}
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'css' : ['stylelint', 'prettier'],           
    \ 'go': ['gofmt'],
    \ 'typescript': ['prettier', 'tslint'],
    \ 'vue': ['eslint'],
    \ 'scss': ['prettier'],
    \}
let g:ale_fix_on_save = 0
let g:ale_linters_explicit = 0
let g:ale_linter_aliases = {}
let g:ale_lint_delay = 200
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '💣'
let g:ale_sign_warning = '⚡︎'
let g:ale_sign_offset = 1000000
let g:ale_sign_style_error = '✗'
let g:ale_sign_style_warning = '⚠'
let g:ale_sign_highlight_linenrs = 1
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_type_map = {}
let g:ale_virtualtext_cursor = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_warn_about_trailing_blank_lines = 0
let g:ale_change_sign_column_color = 1 
highlight! ALESignColumnWithErrors ctermfg=0 ctermbg=8 guifg=#4a4a4a guibg=#4a4a4a
highlight! ALESignColumnWithoutErrors ctermfg=0 ctermbg=0 guifg=#4a4a4a guibg=#4a4a4a

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


" ================== Airline ==============
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='atomic'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



" ================== SYNTASTIC ==============
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

"================== FZF ====================
set rtp+=/usr/local/opt/fzf

"================== Abbreviations ====================
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"================== Mappings ====================
"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Copy/Paste/Cut
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

nmap <c-s> :w<cr>
imap <c-s> <esc>:w <cr>

map <c-n> :cnext<cr>
map <c-m> :cprevious<cr>
nnoremap <leader>a :cclose<cr>


nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab>   :bnext<CR>

" turn to next or previous errors, after open location list
nmap <c-j> :lnext<CR>
nmap <c-k> :lprevious<CR>

"" GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

