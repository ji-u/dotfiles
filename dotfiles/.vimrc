"==============================================================================
"Vimrc
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
            Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer', 'for': ['c', 'cpp' ]}
        " }
        " Files {
            Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
            Plug 'airblade/vim-gitgutter'
            Plug 'tell-k/vim-autopep8'
        " }
        " UI & Themes {
            Plug 'joshdick/onedark.vim', { 'as': 'onedark' }
            Plug 'vim-airline/vim-airline'
            Plug 'vim-airline/vim-airline-themes'

            Plug 'Yggdroot/indentline'
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
                let NERDTreeChDirMode=0
                let NERDTreeQuitOnOpen=1
                let NERDTreeMouseMode=2
                let NERDTreeShowHidden=1
            endif
        " }
        " YouCompleteMe {
            let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
            let g:ycm_max_diagnostics_to_display = 0
            let g:ycm_key_invoke_completion = '<c-n>'
        " }
    " }
" }

" General { 
    " Syntax {
        syntax on
        filetype plugin indent on
        set showmatch
    " }
    " Bells {
        set noerrorbells
        set t_vb=
        set tm=500
    " }
    " Mouse {
        set mouse=a
        set mousehide
        set noimdisable
    " }
    " Curse {
        set whichwrap=b,s,h,l,<,>,[,]
        set scrolljump=5
        set scrolloff=3
    " }
    " Window {
        set splitright
        set splitbelow
        set shortmess=a
    " }
    " Encoding {
        set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,gbk,euc-kr,utf-bom
        set termencoding=utf-8
        set encoding=utf-8
        scriptencoding utf-8
    " }
    " Indent {
        set nowrap
        set autoindent
        set shiftwidth=4
        set expandtab
        set tabstop=4
        set smarttab
        set nojoinspaces
    " }
    " Search {
        set incsearch
        set hlsearch
        set ignorecase
        set smartcase
    " }
    " Editing {
        set autowrite
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*//" | lcd %:p:h | endif
    " }
" }

" UI {
    " Color {
        set t_Co=256
        set background=dark
        colors onedark
    " }
    " Font {
        set anti enc=utf-8
        set guifont=Source\ Code\ Pro\ 11
    " }
    " Components {
        set showmode
        set cursorline
        set number
        set numberwidth=4
    " }
    " Menu {
        set wildmenu
        set wildmode=longest,list,full
    " }
    " Status & command line {
        if has('cmdline_info')
            set ruler
            set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
            set showcmd
        endif
        if has('statusline')
            set laststatus=2
        endif
    " }
" }

" Key mapping { Leader {
        let mapleader     = " " 
        let g:mapleader   = " "
    " } 
    " Faster esc {
        inoremap    jk          <esc>
        inoremap    <esc>       <nop>
    " }
    " Save exit {
        nnoremap     <leader>w   :w<cr> 
        nnoremap     <leader>q   :bd<cr> 
        nnoremap<leader>x   :qa<cr>
    " } 
    " Switch window {
        nnoremap     <c-h>       <c-w>h 
        nnoremap     <c-j>       <c-w>j 
        nnoremap     <c-k>       <c-w>k 
        nnoremap     <c-l>       <c-w>l 
        nnoremap     <tab>       <c-w>w 
        nnoremap     <leader>=   <c-w>=
    " } 
    " Search {
        nnoremap <silent> <leader>/ :nohlsearch<cr>
    " } 
    " Plugin { 
        " Nerdtree {
            nnoremap    <leader>n   :NERDTreeToggle<cr>
        " } 
        " GItGutter {
            nnoremap    <leader>g   :GitGutterToggle<cr>
        " }
    " } 
" }
