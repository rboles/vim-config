"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration provided with Vim distribution _vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if &sh =~ '\<cmd'
    silent execute '!""C:\Program Files\Vim\vim71\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
  else
    silent execute '!C:\Program" Files\Vim\vim71\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vim configuration; see also _gvimrc; sboles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" uncomment for testing...
" set verbose=9
"
" make Vim behave the Vim way (instead of the Vi way)
set nocompatible
" i like the desert colorscheme
colorscheme desert
" turn on syntax highlighting
syntax on
" default textwidth is 75 characters
set textwidth=75
" default tab width is 2 spaces; override with filetype settings
set tabstop=2 shiftwidth=2 expandtab
" copy indent from current line when starting a new line
set autoindent smartindent
" patterns with uppercase characters will make search case sensitive 
set ignorecase smartcase
" create a temporary backup during editing; delete when finished
set nobackup writebackup backupext=~
" xterm style selection; regardless of behavior
set selection=inclusive
" show line and character number
set ruler
" shows how parens match up
set showmatch
" show editting mode
set showmode
" highlight search results
set hlsearch
" turn on filetype plugins
filetype plugin on
" settings by filetype
autocmd BufRead,BufNewFile *.xml,*.kon,*.xo,*.opml set formatoptions=croql
autocmd BufRead,BufNewFile *.js set formatoptions=croql cindent cinoptions=(0t0u0
autocmd BufRead,BufNewFile *.php,*.pl set tabstop=3 shiftwidth=3 formatoptions=croql cindent cinoptions=(0t0u0
autocmd BufRead,BufNewFile *.h,*.c,*.cpp,*.rb set noexpandtab tabstop=2 shiftwidth=2 cindent
" colorschemes by file type
autocmd BufRead,BufNewFile *.js,*.php,*.pl,*.rb colo desert
autocmd BufRead,BufNewFile *.c,*.h,*.cpp colo desert
autocmd BufRead,BufNewFile *.html,*.htm,*.xhtml colo desert
autocmd BufRead,BufNewFile *.xsl,*.xml,*.opml,*.xo colo desert
" mappings
" make up/down go up and down even with wordwrap
map j gj
map <Down> gj
map k gk
map <Up> gk
" Backbase mappings
imap <M-v> <s:variable b:name="" b:scope=""<CR>b:select="" /><Esc>3B2hi
imap <M-a> <s:task b:action="assign" b:target="" b:scope=""<CR>b:select="" /><Esc>3B2hi
imap <M-t> <s:task b:action="trigger" b:event=""<CR>b:target="" /><Esc>3B9li
imap <M-m> <s:task b:action="msg"<CR>b:value="{concat(@c:purpose,'::')}" /><Esc>6hi
imap <M-e> <!--**<CR>--><CR><s:event b:on=""><CR></s:event><Esc>2B6li
" typos
ia funciton function
ia teh the
ia aciton action
ia definately definitely
" abbreviations
ia <![C <![CDATA[ <ESC>i ]]><ESC>hhi
" variable defines
let maplocalleader = "\\"
