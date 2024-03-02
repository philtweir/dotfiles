" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

let g:vimspector_enable_mappings = 'HUMAN'
let g:csv_nomap_cr = 1
let g:csv_nomap_space = 1

Plug 'philtweir/python-syntax-ga'
Plug 'chrisbra/csv.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'sagi-z/vimspectorpy'
Plug 'puremourning/vimspector'
Plug 'voldikss/vim-translator'
Plug 'christianrondeau/vim-base64'
Plug 'w0rp/ale'
Plug 'tssm/fairyfloss.vim'
" Plug 'scrooloose/syntastic'
" Plug 'gmarik/vundle'
" Plug 'godlygeek/tabular'
" Plug 'hallison/vim-markdown'
" Plug 'surround.vim'
" Plug 'speeddating.vim'
" Plug 'VisIncr'
" Plug 'vis'
" Plug 'Rename2'
" Plug 'JSON.vim'
" Plug 'glsl.vim'
" Plug 'django.vim'
" Plug 'bkad/CamelCaseMotion'
" Plug 'groenewege/vim-less'
" Plug 'guns/xterm-color-table.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'krisajenkins/vim-projectlocal'
" Plug 'scrooloose/nerdcommenter'
" Plug 'ShowMarks'
" Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/vim-emoji'
" Colorschemes
Plug 'captbaritone/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'fxn/vim-monochrome'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'

Plug 'embear/vim-localvimrc'
" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'xsbeats/vim-blade', { 'for': 'blade' }
Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Make tab handle all completions
Plug 'ervandew/supertab'

Plug 'posva/vim-vue'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Fancy statusline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Open from quick-fix-list in new split
Plug 'yssl/QFEnter'

Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

" Rename files from within vim
Plug 'tpope/vim-eunuch'

" Make commenting easier
Plug 'tpope/vim-commentary'

" Adjust 'shiftwidth' and 'expandtab' heuristically based on the current file
Plug 'tpope/vim-sleuth'

" CamelCase motions through words
Plug 'bkad/CamelCaseMotion'

" Split and join lines of code intelligently
Plug 'AndrewRadev/splitjoin.vim'

Plug 'gcmt/taboo.vim'

Plug 'chr15m/vim-gherkin'

Plug 'vim-scripts/CursorLineCurrentWindow'

" Plug 'ternjs/tern_for_vim'

" Split navigation that works with tmux
" Plug 'christoomey/vim-tmux-navigator'

" Change brackets and quotes
Plug 'tpope/vim-surround'
" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" Custom motions

" Indent object
Plug 'michaeljsmith/vim-indent-object'
" Camel Case object
Plug 'bkad/CamelCaseMotion'
" Argumetn object
Plug 'vim-scripts/argtextobj.vim'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'airblade/vim-gitgutter'

" Run Python tests in tmux splits
" Plug 'captbaritone/projects/vim-vigilant', { 'for': 'python' }
Plug '~/projects/vim-vigilant', { 'for': 'python' }
Plug 'benmills/vimux', { 'for': ['python', 'javascript'] }

"Plug 'Valloric/YouCompleteMe'
" Python completion and tag navigation
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }

Plug 'FooSoft/vim-argwrap'

" Take notes and keep todo lists in vim
Plug 'vimwiki/vimwiki'

" Find the class/method based on cursor position
"Plug 'vim-scripts/pythonhelper'

" 'Vastly improved Javascript indentation and syntax support in Vim'
Plug 'pangloss/vim-javascript'

Plug 'reedes/vim-pencil'

" Visualize undo tree
Plug 'mbbill/undotree'

Plug 'parkr/vim-jekyll'

Plug 'jamessan/vim-gnupg'

" Other plugins require curl
if executable("curl")

    " Webapi: Dependency of Gist-vim
    Plug 'mattn/webapi-vim'

    " Gist: Post text to gist.github
    Plug 'mattn/gist-vim'
endif

filetype plugin indent on                   " required!
call plug#end()

function! DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " vim uses -b by default
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

let ycm_in_vim_env=$YCM_IN_VIM

let g:ycm_rust_src_path = '/usr/local/src/rust-git/src'

if ycm_in_vim_env == '1'
  Plug 'Valloric/YouCompleteMe'
endif
Plug 'philtweir/vim-hardtime'

let g:showmarks_enable=0

set t_Co=256

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Section: configuration

  set list
  set listchars=tab:›—,trail:␣,extends:▶,precedes:◀

  scriptencoding utf-8

  colorscheme fairyfloss

  " These two enable syntax highlighting
  set nocompatible          " We're running Vim, not Vi!
  syntax on                 " Enable syntax highlighting

  " Enable filetype-specific indenting and plugins
  filetype plugin indent on

  " show the `best match so far' as search strings are typed
  set incsearch

  " Highlight search results once found:
  set hlsearch

  " highlight the current line the cursor is on
  set cursorline
  " highlight the current column the cursor is on
  "set cursorcolumn

  "sm:    flashes matching brackets or parentheses
  set showmatch

  "sta:   helps with backspacing because of expandtab
  set smarttab

  " Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " When scrolling off-screen do so 3 lines at a time, not 1
  set scrolloff=3

  " enable line numbers 
  set number
  setlocal numberwidth=5
  set rnu

  " Enable tab complete for commands.
  " first tab shows all matches. next tab starts cycling through the matches
  set wildmenu
  set wildmode=list:longest,full

  " don't complete from included files, on account of slow
  set complete-=i

  " Display extra whitespace
  "set list listchars=tab:»·,trail:·

  " don't make it look like there are line breaks where there aren't:
  "set nowrap

  " assume the /g flag on :s substitutions to replace all matches in a line:
  set gdefault

  " Load matchit (% to bounce from do to end, etc.)
  runtime! macros/matchit.vim

  " Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " enable setting title
  set title
  " configure title to look like: Vim /path/to/file
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " can has foldin plz?
  set foldenable
  set foldmethod=syntax
  set foldlevel=999 " make it really high, so they're not displayed by default
  
  " 'murica
  set spelllang=en_us
  

  " Turn off rails bits of statusbar
  let g:rails_statusline=0

  let g:browser = 'open '

  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType python set autoindent shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType python-ga set autoindent shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType cpp set autoindent shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType javascript,html,htmldjango,css set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType puppet set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType php set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx 
    " treat rackup files like ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile *.pyga set ft=python-ga
    au BufRead,BufNewFile Gemfile set ft=ruby
    autocmd BufEnter *.haml setlocal cursorcolumn
    au BufRead,BufNewFile Gemfile set ft=ruby                                   
    au BufRead,BufNewFile Capfile set ft=ruby                                   
    au BufRead,BufNewFile Thorfile set ft=ruby                                   
    au BufRead,BufNewFile *.god set ft=ruby  
    au BufRead,BufNewFile .caprc set ft=ruby  
    " au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endi

  " Don't pclose the Preview window after doc viewing (stop flickering)
  let g:jedi#auto_close_doc=0

  " Turn on language specific omnifuncs
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete


  " have some fun with bufexplorer
  let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

" IRB {{{
  autocmd FileType irb inoremap <buffer> <silent> <CR> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, eval(v[v.line_number]).inspect)<CR>

" Section: functions

  function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
  endfunction

  " Open the Rails ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRailsDoc(keyword)
    let url = 'http://apidock.com/rails/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

  " Open the Ruby ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRubyDoc(keyword)
    let url = 'http://apidock.com/ruby/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

" Section: commands

  " Shell
  command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

  " Ruby code metrics
  command! -complete=file -nargs=+ Reek :Shell reek <q-args>
  command! -complete=file -nargs=+ Roodi :Shell roodi <q-args>
  command! -complete=file -nargs=+ Flog :Shell flog -m -I lib <q-args> 2>/dev/null

" Section: mappings

  " Tab navigation
  nmap <leader>tn :tabnext<CR>
  nmap <leader>tp :tabprevious<CR>
  nmap <leader>te :tabedit

  " Remap F1 from Help to ESC.  No more accidents.
  nmap <F1> <Esc>
  map! <F1> <Esc>

  " insert hashrocket, =>, with control-l
  "imap <C-l> <Space>=><Space>

  " align hashrockets with <leader>t control-l
  "vmap <leader>t<C-l> :Align =><CR>

  " <leader>F to begin searching with ack
  map <leader>F :Ack<space>

  " search next/previous -- center in page
  nmap n nzz
  nmap N Nzz
  nmap * *Nzz
  nmap # #nzz

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Hide search highlighting
  map <silent> <leader>nh :nohls <CR>

  " toggle Quickfix window with <leader>q
  map <silent> <leader>q :QFix<CR>

  nnoremap <leader>irb :<C-u>below new<CR>:setfiletype irb<CR>:set syntax=ruby<CR>:set buftype=nofile<CR>:set bufhidden=delete<CR>i

  " Easily lookup documentation on apidock
  noremap <leader>rb :call OpenRubyDoc(expand('<cword>'))<CR>
  noremap <leader>rr :call OpenRailsDoc(expand('<cword>'))<CR>

  " Easily spell check
  " http://vimcasts.org/episodes/spell-checking/
  nmap <silent> <leader>s :set spell!<CR>
  

  map <C-c>n :cnext<CR>
  map <C-c>p :cprevious<CR>

  function! RspecToMocha()
    silent! %s/\.stub!\?(/.stubs(/
    silent! %s/and_return/returns/
    silent! %s/should_receive/expects/
    silent! %s/should_not_receive\((.*)\)/expects\1.never
    silent! %s/and_raise/raises/
    :w
  endfunction
  command! RspecToMocha call RspecToMocha()

  set undofile
  set undodir=~/.vim/undodir

  nmap <leader>p :CtrlPBufTagAll<cr>

  set visualbell

  let g:airline_powerline_fonts=1
  let g:airline_theme='molokai'

  nnoremap <leader>] :YcmCompleter GoTo<CR>
  "let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
  "let g:ycm_extra_conf_globlist = ['~/Work/*', '/home/scratch/*']

  let g:hardtime_default_on = 0
  let g:hardtime_allow_different_key = 1

" http://stackoverflow.com/questions/1265410/is-there-a-way-to-configure-vimdiff-to-ignore-all-whitespaces
  set diffopt+=iwhite
  set diffexpr=DiffW()
  let g:python_highlight_all = 1
  " let g:syntastic_python_python_exec = '/usr/bin/python3'
  " let g:syntastic_python_pylint_exe = '/usr/bin/pylint'
  " let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
  " let g:syntastic_php_phpcs_args = '--standard=PSR2'
  " let g:syntastic_javascript_checkers = ['eslint']
  " let g:syntastic_vue_checkers = ['eslint']
  " let g:ale_linters = {'rust': ['rls']}
  let g:ale_completion_enabled = 1
  let g:ale_lint_delay = 500
  let g:ale_lint_on_text_changed = 'normal'
  " let g:ale_php_phpcs_standard = '$HOME/.config/composer/vendor/pragmarx/laravelcs/Standards/Laravel/ --exclude=Laravel.Tabs.DisallowWhitespaceIndent'
  let g:ale_linters = {'python': ['pylint', 'mypy', 'pylsp']}
  let g:ale_python_auto_poetry = 1
  let g:ale_python_mypy_auto_poetry = 1
  let g:ale_python_pylsp_auto_poetry = 1

  nnoremap <buffer> <C-]> :ALEGoToDefinition<CR>
  nnoremap <buffer> <C-^> :ALEFindReferences<CR>
  " setlocal omnifunc=ale#completion#OmniFunc

  set expandtab
  set shiftwidth=2

  nnoremap : <space>
  nnoremap <space> :
  nnoremap <Left> :tabprevious<CR>
  nnoremap <Right> :tabnext<CR>

  autocmd BufNewFile,BufRead *.rs set filetype=rust
  "let g:syntastic_rust_clippy_post_args = ['--release', '--', '-Dclippy', '-Wclippy_pedantic']

  "autocmd BufNewFile,BufRead *.vue set filetype=html

  let g:localvimrc_whitelist = '/home/philtweir/Work/Flax_and_Teal/Sync/Clients/Ogg/Project/orp-frontend'

  set t_ZH=[3m
  set t_ZR=[23m

  set termguicolors

  set diffopt+=vertical

  if exists('$TMUX')

    " Colors in tmux
    "
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  endif

  highlight Statement cterm=italic
  highlight Comment cterm=italic
  let g:translator_target_lang='en'
  let g:translator_source_lang='ga'
  nmap <silent> <Leader>t <Plug>Translate
  vmap <silent> <Leader>t <Plug>TranslateV

  if &diff
      colorscheme evening
  endif
