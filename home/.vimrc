set autowrite
set nocompatible
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set copyindent
set smartindent
set laststatus=2
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀
set cinkeys=0{,0},0),:,o,O
set cino=g0,Ls
set mouse=a
set nowrap
set showcmd
set hlsearch
set nrformats=octal,hex,alpha
set updatetime=500
set foldmethod=marker
set history=200
set viminfo='100,s10,h,%
set guioptions=ac
set statusline=%<%f\ %h%w%m%r\ %=%-14.(%4l/%L,%c%V%)\ %P
let g:c_no_curly_error=1

nmap K i<Cr><Esc>
nmap <Leader>o VaBJds{
nmap <Leader>b i{<Cr><Esc>o}<Esc>k^
nmap <Leader>n :NERDTreeToggle<Cr>
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

syntax on
colorscheme trusty

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'hallison/vim-markdown'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'The-NERD-tree'
Bundle 'speeddating.vim'
Bundle 'VisIncr'
Bundle 'vis'
Bundle 'Rename2'
Bundle 'JSON.vim'
Bundle 'glsl.vim'
Bundle 'django.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'openscad.vim'
Bundle 'groenewege/vim-less'
Bundle 'guns/xterm-color-table.vim'
Bundle 'tpope/vim-fugitive'

Bundle 'ShowMarks'
let g:showmarks_enable=0

if has('python')

	Bundle 'UltiSnips'
	let g:UltiSnipsSnippetDirectories=["ultisnips"]
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

endif

filetype plugin on
filetype indent on
