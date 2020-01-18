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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set number
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set rtp=C:\\Program\ Files\ (x86)\\Vim/vimfiles,C:\\Program\ Files\ (x86)\\Vim\\vim82,C:\\Program\ Files\ (x86)\\Vim/vimfiles/after
set backupdir=C:\\temp\\swp,C:\\temp
set dir=C:\\temp\\swp,C:\\temp
set tildeop
"set guifont=Courier_New:h10:b:cANSI
set guifont=Consolas:h10 
"set guifontwide=MingLiU:h10 "For windows to display mixed character sets
set encoding=utf-8 
set lines=48 columns=170
:winpos 680 10


syntax on
filetype on
au BufNewFile,BufRead *.less set filetype=css
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>

"cp will copy the current file name into the unnamed register which can be pasted with p
:nmap cp :let @" = expand("%")

" ,n will copy the current line number into the clipboard
map ,n <Esc>:let @*=line(".")<CR>

"Move between windows and maximise 
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

let g:cssColorVimDoNotMessMyUpdatetime = 1
