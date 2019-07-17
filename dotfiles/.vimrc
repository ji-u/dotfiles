"==============================================================================
" Vimrc
" 
" @author: Yu Ji
"==============================================================================

" Plugin manager {
  
  " Install & setup {
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif 

    call plug#begin('~/.vim/plugged')
  " }

  " Plugins {
    " C++ support {
      Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang', 'for': ['c', 'cpp' ]}
    " }
    
    " Files {
      Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    " }
    
    " Themes {
      Plug 'joshdick/onedark.vim', { 'as': 'onedark' }
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
    " }
  " }

  " Finish & end {
    call plug#end()  
  " }

  " Settings {
    " NerdTree {
      if isdirectory(expand("~/.vim/Plugged/nerdtree"))
          let g:NERDShutUp=1
          let NERDTreeShowBookmarks=1
          let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$' ]
          let NERDTreeMouseMode=2
          let NERDTreeShowHidden=1
      endif
    " }
  " }
" }

" UI {
  set t_Co=256
  syntax on
  set background=dark
  colors onedark 
  set showmode
  set cursorline

  set backspace=indent,eol,start
  set linespace=0
  set number
  set numberwidth=4
  set showmatch
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  set wildmenu
  set wildmode=list:longest,full
  set whichwrap=b,s,h,l,<,>,[,]
  set scrolljump=5
  set scrolloff=3
  set nofoldenable

  set nowrap
  set autoindent
  set shiftwidth=4
  set expandtab
  set tabstop=4
  set smarttab
  set nojoinspaces
  set splitright
  set splitbelow
" }


