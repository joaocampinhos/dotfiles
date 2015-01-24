set encoding=utf-8

" Plugins
" --------------------
call plug#begin()
"Status Bar
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
"Interaction Plugins
Plug 'kien/ctrlp.vim'
"Colors
Plug 'whatyouhide/vim-gotham'
call plug#end()



" syntax highlighting
" --------------------
syntax enable
colorscheme gotham



" status bar  (airline)
" --------------------
set laststatus=2 " show status bar
set noshowmode " dont show duplicated image
set shortmess=atI " abr and disable splash screen
set showcmd " show commands
let g:airline_powerline_fonts = 1 " testing



" files
" --------------------
set hidden " show hidden files
set autoread " reload files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' " ignore ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git \ls-files -oc --exclude-standard']



" spaces and identation
" 2 spaces
" --------------------
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
" show whitespace
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮



" other stuff
" --------------------
set iskeyword-=_ " goal: camelCase and words_like_this treated as multiple words
set incsearch " search as you type
let mapleader = ',' " because everyone does this
set scrolloff=3 " start scroll earlier
set ignorecase " Ignore case when searching...
set smartcase " ...except if we input a capital letter
set backspace=indent,eol,start " line ending movement wrap
set whichwrap=h,l,b,<,>,~,[,]
set cursorline "highlight current line



" hybrid mode
" --------------------
set relativenumber
set number



" filetypes
" --------------------
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.scss set filetype=css



" Key mappings
" --------------------
map <silent> <leader>V :source ~/.nvimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" reload .vimrc

command! W  write " :W to do the same as :w

" jj to throw you into normal mode from insert mode
inoremap jj <esc>
" jk to throw you into normal mode from insert mode
inoremap jk <esc>

" beter paste ,p
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" better buffer cicle (Tab and Shift+Tab)
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>

" remove whitespace
nnoremap <Leader>rws :%s/\s\+$//e<CR>


" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
