" ------------------------------------------------------------
" Load plugins
" ------------------------------------------------------------

set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Plugins will be downloaded under the specified directory.
call vundle#begin('~/.vim/plugged')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Better escape
Plugin 'jdhao/better-escape'

" Copy to clipboard
Plugin 'ojroques/vim-oscyank', {'branch': 'main'}

" Linting
Plugin 'dense-analysis/ale'

" Colorschemes
Plugin 'catppuccin/vim'

" Vim status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Rainbow parentheses
Plugin 'junegunn/rainbow_parentheses.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Language pack
Plugin 'sheerun/vim-polyglot'

" Insert or delete brackets, parens, quares in pair
Plugin 'jiangmiao/auto-pairs'

" Tree explorer
Plugin 'preservim/nerdtree'

" Text searching
Plugin 'dyng/ctrlsf.vim'

" Display tags of the current file
Plugin 'preservim/tagbar'

" Switching between companion files (e.g. '.h' and '.cpp' files)
Plugin 'derekwyatt/vim-fswitch'

" Pull C++ ptototypes into the implementation file
Plugin 'derekwyatt/vim-protodef'

" Python autocompletion
Plugin 'davidhalter/jedi-vim'

" Drag selection
Plugin 'gavinbeatty/dragvisuals.vim'

" dbext
Plugin 'vim-scripts/dbext.vim'

" REPL enviroments
Plugin 'sillybun/vim-repl' " Python
Plugin 'jalvesaq/Nvim-R'   " R

" LaTeX
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" List ends here. Plugins become visible to Vim after this call.
call vundle#end()
filetype plugin indent on

" ------------------------------------------------------------
" auto-pairs configuration
" ------------------------------------------------------------

let g:AutoPairsShortcutToggle = '<C-P>'

" ------------------------------------------------------------
" Colorscheme configuration
" ------------------------------------------------------------

if has('termguicolors')
set termguicolors
endif

colorscheme catppuccin_mocha

" ------------------------------------------------------------
" Airline configuration
" ------------------------------------------------------------

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'deus'

" ------------------------------------------------------------
" rainbow_parentheses configuration
" ------------------------------------------------------------

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" ------------------------------------------------------------
" NERDTree configuration
" ------------------------------------------------------------

let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeMinimalMenu = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31

" ------------------------------------------------------------
" tagbar configuration
" ------------------------------------------------------------

let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_position = 'botright vertical'

" ------------------------------------------------------------
" ctrlsf configuration
" ------------------------------------------------------------

let g:ctrlsf_backend = 'ack'
let g:ctrlsf_auto_close = { "normal": 0, "compact": 0 }
let g:ctrlsf_auto_focus = { "at": "start" }
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view = 'normal'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '46'
let g:ctrlsf_default_root = 'cwd'

" ------------------------------------------------------------
" fswitch configuration
" ------------------------------------------------------------

au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h   let b:fswitchdst = 'cpp,c'

" ------------------------------------------------------------
" vim-repl configuration 
" ------------------------------------------------------------

let g:repl_auto_sends = [
            \ 'class ', 'def ', 'for ', 'if ', 'while ', 
            \ 'with ', 'async def', '@', 'try'
            \ ]
let g:repl_cursor_down = 1
let g:repl_python_auto_send_unfinish_line = 1
let g:repl_python_automerge = 1
let g:repl_position = 3

" ------------------------------------------------------------
" Nvim-R configuration 
" ------------------------------------------------------------

let R_rconsole_width = winwidth(0) / 2
autocmd VimResized * let R_rconsole_width = winwidth(0) / 2
let R_assign = 0
let R_source = '~/.vim/plugged/Nvim-R/R/tmux_split.vim'

" ------------------------------------------------------------
" better-escape configuration 
" ------------------------------------------------------------

let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.2 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction

" ------------------------------------------------------------
" LaTeX configuration 
" ------------------------------------------------------------

let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
\ 'backend' : 'nvim',
\ 'background' : 1,
\ 'build_dir' : '',
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'executable' : 'latexmk',
\ 'options' : [
\ '-pvc',
\ '-shell-escape',
\ '-verbose',
\ '-file-line-error',
\ '-synctex=1',
\ '-interaction=nonstopmode',
\ ]
\ }
let g:tex_flavor='latex'
let g:vimtex_view_skim_sync = 1 
let g:vimtex_view_skim_activate = 1
let g:livepreview_previewer = 'open -a Skim'

" ------------------------------------------------------------
" Vim configuration
" ------------------------------------------------------------

set hidden              " move between buffers without saving modifications
set nu                  " Enable line numbers
syntax on               " Enable synax highlighting
set incsearch           " Enable incremental search
set hlsearch            " Enable highlight search
set splitbelow          " Always split below
set splitright          " Always split right
set mouse=a             " Enable mouse drag on window splits
set tabstop=4           " How many columns of whitespace a \t is worth
set shiftwidth=4        " How many columns of whitespace a level of indentation is worth
set expandtab           " Use spaces when tabbing
set background=dark     " Set background 
set notermguicolors     " For transparent terminal

" ------------------------------------------------------------
" Key mappings
" ------------------------------------------------------------

" General
nmap         <C-B>      :buffers<CR>
nmap         <C-J>      :term<CR>

" better-escape
inoremap     <expr>j    JKescape('j')
inoremap     <expr>k    JKescape('k')

" Rainbow parentheses
nnoremap     <leader>rp :RainbowParentheses!!<CR>

" NERDTree
nmap         <C-n>      :NERDTreeToggle<CR>

" vim-repl
nnoremap     <leader>\  :REPLToggle<CR>
nnoremap     <leader>h  :REPLHide<CR>

" tagbar
nmap         <C-t>      :TagbarToggle<CR>

" ctrlds
nmap         <C-F>f     <Plug>CtrlSFPrompt
xmap         <C-F>f     <Plug>CtrlSFVwordPath
xmap         <C-F>F     <Plug>CtrlSFVwordExec
nmap         <C-F>n     <Plug>CtrlSFCwordPath
nmap         <C-F>p     <Plug>CtrlSFPwordPath
nnoremap     <C-F>o     :CtrlSFOpen<CR>
nnoremap     <C-F>t     :CtrlSFToggle<CR>
inoremap     <C-F>t     <Esc>:CtrlSFToggle<CR>

" fswitch
nmap         <C-Z>      :vsplit <bar> :wincmd l <bar> :FSRight<CR>

" switch between tabs
nnoremap     <C-H>      <C-W>h
nnoremap     <C-J>      <C-W>j
nnoremap     <C-K>      <C-W>k
nnoremap     <C-L>      <C-W>l
nnoremap     <leader>[  :bprevious<CR>
nnoremap     <leader>]  :bnext<CR>

" dragvisuals
vmap <expr> <S-LEFT>  DVB_Drag('left')
vmap <expr> <S-RIGHT> DVB_Drag('right')
vmap <expr> <S-DOWN>  DVB_Drag('down')
vmap <expr> <S-UP>    DVB_Drag('up')

" vim-protodef
nmap <buffer> <silent> <leader> ,PP
nmap <buffer> <silent> <leader> ,PN

" transparent bg
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi Terminal ctermbg=NONE
autocmd vimenter * hi StatusLine ctermbg=NONE cterm=NONE
autocmd vimenter * hi StatusLineNC ctermbg=NONE cterm=NONE
autocmd vimenter * hi StatusLineTerm ctermbg=NONE cterm=NONE
autocmd vimenter * hi StatusLineTermNC ctermbg=NONE cterm=NONE

" tex
autocmd Filetype tex setl updatetime=1
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>

" Rainbow parentheses
autocmd vimenter * RainbowParentheses

" Copy to clipboard
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif

" highlight n'th symbol
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

