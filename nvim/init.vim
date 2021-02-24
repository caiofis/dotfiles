set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Vundle.vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }

Plugin 'vim-gitgutter'

Plugin 'davidhalter/jedi-vim'

Plugin 'preservim/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin' 
Plugin 'ryanoasis/vim-devicons'

Plugin 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'

Plugin 'taglist.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"Config Section

"Colors
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
colorscheme gruvbox
set bg=dark

" fzf
let g:fzf_layout = { 'down': '40%' }
nnoremap <silent> <C-o> :Files<CR>
nnoremap <silent> <C-p> :Buffers<CR>
let $FZF_DEFAULT_OPTS = "--bind ctrl-k:preview-up,ctrl-j:preview-down"
" Set font
set encoding=UTF-8
"set guifont
"
" NERDTree - Side bar
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeChDirMode=2
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1

" NERDTree Git Plugin
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }


set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set ignorecase
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8
set colorcolumn=100
set signcolumn=yes
set splitbelow
set splitright
set clipboard=unnamedplus


"Import roslaunch highlight
au BufNewFile,BufRead,BufReadPost *.launch source ~/.config/nvim/roslaunch.vim