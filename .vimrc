
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
set updatetime=100   " Certain plugins use this for CursorHold event triggering
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
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_addtags_transform = 'camelcase'
let g:go_gopls_staticcheck = 1
let g:go_list_type = 'quickfix'
let g:go_auto_sameids = 1
let g:go_doc_popup_window = 1

" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" gotests-vim
let g:gotests_bin = $HOME.'/Projects/go/bin/gotests'

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
nmap <silent> <C-e> <Plug>(ale_next_wrap)

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_warnings = l:counts.total - l:all_errors

    let l:errors_recap = l:all_errors == 0 ? '' : printf('%d❌ ', all_errors)
    let l:warnings_recap = l:all_warnings == 0 ? '' : printf('%d⚠ ', all_warnings)
    return (errors_recap . warnings_recap)
endfunction

set statusline+=%=
set statusline+=\ %{LinterStatus()}

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_highlight_linenrs = 1

let g:ale_fixers = {
  \ 'go': ['gofmt', 'goimports', 'golines'],
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \}

let g:ale_fix_on_save = 1

" ================= Colors =================
syntax enable
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai


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
let g:airline_theme='simple'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

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
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)"')"
if has("gui_running")
else
  noremap <S-f> :GFiles<cr>
endif
set rtp+=/usr/local/opt/fzf


" ==================== NerdTree ====================
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1


nmap <Leader>f :NERDTreeToggle<Enter>
map <S-Right> :tabn<cr>
map <S-Left> :tabp<cr>

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

"===================== Rainbow ====================
let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['yellow', 'lightblue', 'magenta', 'lightgreen', 'red']

" ==================== Completion + Snippet ====================
" Ultisnips has native support for SuperTab. SuperTab does omnicompletion by
" pressing tab. I like this better than autocompletion, but it's still fast.
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" terminal emulation
nnoremap <silent> <leader>sh :term<CR>
