set nocompatible

source $HOME/.vim/plugins.vim

"===========================================================
" SETTINGS
"===========================================================

" Enable syntax highlighting.
"
syntax on


" General vim settings.
"
set autoindent        " Indented text
set autoread          " Pick up external changes to files
set autowrite         " Write files when navigating with :next/:previous
set backspace=indent,eol,start  "Allow backspace in insert mode
set belloff=all       " Bells are annoying
set breakindent       " Wrap long lines *with* indentation
set breakindentopt=shift:2
if has('unnamedplus') " Copy to/from system clipboard
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82 " Highlight 81 and 82 columns
set conceallevel=0    " Always show text normally
set complete=.,w,b    " Sources for term and line completions
set completeopt=menu,menuone,noinsert,noselect
set dictionary=/usr/share/dict/words
set expandtab         " Use spaces instead of tabs
set foldlevelstart=20
set foldmethod=indent " Simple and fast
set foldtext=''
set formatoptions=cqj " Default format options
set gdefault          " Always do global substitutes
set history=200       " Keep 200 changes of undo history
set infercase         " Smart casing when completing
set ignorecase        " Search in case-insensitively
set incsearch         " Go to search results immediately
set laststatus=2      " We want a statusline
set mouse=a           " Mouse support in the terminal
set mousehide         " Hide mouse when typing text
set nobackup          " No backup files
set noexrc            " Disable reading of working directory vimrc files
set nojoinspaces      " No to double-spaces when joining lines
set noshowcmd         " No to showing command in bottom-right corner
set noshowmatch       " No jumping jumping cursors when matching pairs
set noshowmode        " No to showing mode in bottom-left corner
set noswapfile        " No backup files
set number            " Show line numbers
set nrformats=        " No to oct/hex support when doing CTRL-a/x
set path=**
set pumheight=20      " Height of complete list
set shiftwidth=2      " Default indentation amount
set shortmess+=c      " Don't show insert mode completion messages
set shortmess+=I      " Don't show intro message
set signcolumn=auto   " Only render sign column when needed
set showbreak=↳       " Use this to wrap long lines
set smartcase         " Case-smart searching
set smarttab          " Tab at the start of line inserts blanks
" When spell checking, assume word boundaries include 'CamelCasing'.
if exists('&spelloptions')
    set spelloptions=camel
endif
set splitbelow        " Split below current window
set splitright        " Split window to the right
set tabstop=4         " Tab width
set textwidth=80      " Standard width before breaking
set timeoutlen=1500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break some Vim terminal
" behaviours
set ttimeoutlen=10
" Set the persistent undo directory on temporary private fast storage.
let s:undoDir='/tmp/.undodir_' . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, '', 0700)
endif
let &undodir=s:undoDir
set undofile          " Maintain undo history
set updatetime=1000   " Certain plugins use this for CursorHold event triggering
set wildcharm=<Tab>   " Defines the trigger for 'wildmenu' in mappings
set wildmenu          " Nice command completions
set wildmode=full     " Complete the next full match
set wrap              " Wrap long lines
set cryptmethod=blowfish2
set listchars=eol:$,tab:>-,trail:-
if exists('&cursorlineopt')
    set cursorline
    set cursorlineopt=number
endif

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

"========== User Interface Options ==========
set ttyfast
set title

"Text Rendering Options
set fileencoding=utf-8
set encoding=utf-8

" Misellaneous
set hidden showcmd                     "Show incomplete cmds down the bottom
set gcr=a:blinkon0
set nolist
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set nocursorcolumn           " speed up syntax highlighting
set nocursorline

"" Searching
set hlsearch " Highlight found searches

" increase max memory to show syntax highlighting for large files
set maxmempattern=20000

set lazyredraw " Avoid lags

"Indentation Options
filetype plugin indent on
set shiftround
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


" ================ Turn off Swap Files ==================
set nowb

" ==================== Scrolling ========================
" improve scroll performance for certain file types
augroup syntaxSyncMinLines
    autocmd!
    autocmd Syntax * syntax sync minlines=2000
augroup END

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

"=========================================================
"======================== Markdow ========================
"=========================================================
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_minlines = 100
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go']


"=========================================================
"======================== Golang =========================
"=========================================================
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
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
let g:go_metalinter_enabled = ['vet', 'revive', 'errcheck', 'deadcode']
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['revive']
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
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>tf :GoTestFunc<cr>
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

"=========================================================
"======================== Python =========================
"=========================================================
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set autoindent

" =======================================================
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"=========================================================
"======================== ALE ============================
"=========================================================
let g:ale_echo_cursor = 1
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_enabled = 1

let g:ale_linters = {
    \ 'go': ['go build', 'gofmt', 'go vet', 'gopls', 'revive'],
    \'javascript': ['eslint'],
    \ 'python': ['flake8', 'bandit']
    \}

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines'],
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint', 'prettier'],
    \ 'css' : ['stylelint', 'prettier'],
    \ 'go': ['gofmt'],
    \ 'python': ['black'],
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

"=====================================================
"======================== StatusLine =================
"=====================================================
let s:modes = {
      \ 'n': 'NORMAL',
      \ 'i': 'INSERT',
      \ 'R': 'REPLACE',
      \ 'v': 'VISUAL',
      \ 'V': 'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT',
      \ 'S': 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'TERMINAL'
      \}

let s:prev_mode = ""
function! StatusLineMode()
  let cur_mode = get(s:modes, mode(), '')

  " do not update higlight if the mode is the same
  if cur_mode == s:prev_mode
    return cur_mode
  endif

  if cur_mode == "NORMAL"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=148 ctermfg=22'
  elseif cur_mode == "INSERT"
    exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
  elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
  endif

  let s:prev_mode = cur_mode
  return cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
 let branch = fugitive#head()
 let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
 if branch !=# ''
   return printf("%s | %s", branch, filename)
 endif
 return filename
endfunction

exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %*

" go command status (requires vim-go)
set statusline+=%#goStatuslineColor#
set statusline+=%{go#statusline#Show()}
set statusline+=%*

" right section seperator
set statusline+=%=

" filetype, percentage, line number and column number
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v
set statusline+=\ %*

" ================= Colors =================
syntax enable
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme solarized8_high

" ================ Formatters ===============
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


" ================== Airline ==============
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_theme='atomic'
let g:airline_theme='simple'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ================== SYNTASTIC ==============
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump=0
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_go_checkers = ['go', 'revive', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

"================== FZF ====================
set rtp+=/usr/local/opt/fzf

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

"================== Abbreviations ====================
" no one is really happy until you have this shortcuts
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
nnoremap <Leader>gb :.GBrowse<CR>

map <c-n> :cnext<cr>
map <c-m> :cprevious<cr>
nnoremap <leader>a :cclose<cr>

" Center the screen
nnoremap <space> zz

" Close all but the current one
nnoremap <leader>o :only<CR>
" Print full path
map <C-f> :echo expand("%:p")<cr>

" turn to next or previous errors, after open location list
nmap <c-j> :lnext<CR>
nmap <c-k> :lprevious<CR>

"" GitGutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGuttierPreviewHunk)

"===================== Buffer maps ====================
map gn :bn<cr>
map gp :bp<cr>
map gD :bd<cr>


" ==================== Completion + Snippet ====================
" Ultisnips has native support for SuperTab. SuperTab does omnicompletion by
" pressing tab. I like this better than autocompletion, but it's still fast.
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
