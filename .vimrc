""" Don't touch stuff {{{
scriptencoding utf-8
set encoding=utf-8

set nocompatible

"}}}

" Vundle / Plugin manager {{{
" https://github.com/VundleVim/Vundle.vim

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

	Plugin 'VundleVim/Vundle.vim'
	
	" Tmux & vim integration, somehow
	Plugin 'christoomey/vim-tmux-navigator' 

	" Aligning of text
	Plugin 'godlygeek/tabular'

	" Draw lines and boxes
	Plugin 'hrj/vim-DrawIt'

	Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on

"}}}

" Tabs {{{
set tabstop=4
set shiftwidth=4

" Sets the tabwith to 2 for html files
	autocmd BufNewFile,BufRead *.html set tabstop=2
	autocmd BufNewFile,BufRead *.html set shiftwidth=2

	autocmd BufNewFile,BufRead *.htm  set tabstop=2
	autocmd BufNewFile,BufRead *.htm  set shiftwidth=2

	autocmd BufNewFile,BufRead *.php  set tabstop=2
	autocmd BufNewFile,BufRead *.php  set shiftwidth=2

	autocmd BufNewFile,BufRead *.css  set tabstop=4
	autocmd BufNewFile,BufRead *.css  set shiftwidth=4

" Soft tabs in haskell
	autocmd BufNewFile,BufRead *.hs set expandtab

"}}}

" Higlighting {{{
" Color marking when passing line 80
	call matchadd('ColorColumn', '\%81v', 100)

"" Highlighting
	syntax on
	colorscheme torte
	set background=light
	hi ColorColumn ctermbg=5

	" rgb=38,38,38
	hi normal ctermbg=235
	"hi normal ctermbg=black
	"hi LineNr ctermfg=yellow 

	"hi statement ctermfg=yellow
	hi LineNr ctermfg=yellow 
	hi spellbad ctermbg=red

	hi Search ctermfg=1 ctermbg=3

	autocmd Filetype lisp call SetLispMode()
	function SetLispMode()
		set expandtab
		set background=dark
		hi Comment    cterm=NONE ctermfg=08
		hi Constant   cterm=NONE ctermfg=White
		hi Identifier cterm=NONE ctermfg=White
		hi Function   cterm=NONE ctermfg=White
		hi Statement  cterm=NONE ctermfg=White
		hi PreProc    cterm=NONE ctermfg=White
		hi Type	      cterm=NONE ctermfg=White
		hi Special    cterm=NONE ctermfg=White
		hi Delimiter  cterm=NONE ctermfg=White
	endfunction

"}}}

" Key remaps {{{
	""" maps space to <leader>, and makes it show up with 'showcmd'
	nnoremap <leader> \
	nmap <space> \

	""" Moving between buffers
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

	""" Leader maps
	nnoremap <silent> <leader>o :nohlsearch <cr>
	nnoremap <leader>h :vertical help 
	" Used by eclim to fix everything
	nnoremap <leader>j :JavaCorrect <cr>
	
	nnoremap <leader>t iTODO

	nnoremap <leader>d 0D
	nnoremap <silent> <leader>a :set foldlevel=0 <cr>

	""" other
	nnoremap <cr> o<esc>
	" uses what looks like a line, instead of the actual lines
	nnoremap j gj
	nnoremap k gk
	nnoremap gj j
	nnoremap gk k

"}}}	

" Folding {{{
	set foldmethod=marker
	set foldnestmax=20
	set foldlevelstart=0
	set foldlevel=0

	autocmd Filetype java call SetJavaIndent()
	function SetJavaIndent()
		set foldmethod=indent
		set foldnestmax=2
		set foldlevelstart=99
		set foldlevel=99
	endfunction

	set foldenable
"}}}

" Other {{{

set smartindent
set mouse=a

set number

" makes wrapped lines have the same indention as the original line
set breakindent

" use a visual cue instead of a sound cue for messages
set visualbell

" Display filename on the next to last line
set laststatus=2

" Show cursor possition in info bar
set ruler

" Show button presses in lower right portion of the screen
set showcmd

" Ignore case while searching
set ignorecase

" Tab shows options, <ctrl-d> is used to show all possabilities
set wildmenu

" New splits in better places
set splitbelow
set splitright


""" Searching
set incsearch
set hlsearch

set completeopt=longest,menuone

" Whitespace highlighting
" ':set list' to enable
"exec "set listchars=tab:>\u2015,eol:\u00b6,nbsp:\u2423,trail:~"
exec "set listchars=tab:>—,eol:\u00b6,nbsp:\u2423,trail:~"

com! FormatJSON %!python -m json.tool



"}}}
