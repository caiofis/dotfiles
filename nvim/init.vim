call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'davidhalter/jedi-vim'

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'

Plug 'dracula/vim'
Plug 'morhetz/gruvbox'

"Plug 'ervandew/supertab'

Plug 'rhysd/vim-clang-format'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"Config Section

"Colors
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
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

nmap <C-k> :ClangFormat<CR>
vmap <C-k> :ClangFormat<CR>

nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>

nmap <C-t> :TagbarToggle<CR>
set statusline=%<%f\ %h%m%r%=%{tagbar#currenttag('%s\ ','','f')}%-.(%l,%c%V%)\ %P

let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-cmake',
    \]
" Settings
set signcolumn=no
set updatetime=300
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Search on visual mode
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set norelativenumber
set nu
set cursorline
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
set autoread | au CursorHold * checktime | call feedkeys("lh")

let $BASH_ENV = "~/.bash_aliases"

"Import roslaunch highlight
au BufNewFile,BufRead,BufReadPost *.launch source ~/.config/nvim/roslaunch.vim
