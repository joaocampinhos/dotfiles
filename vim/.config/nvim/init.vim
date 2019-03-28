set encoding=utf-8

" Plugins
" --------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Begin Plug
call plug#begin()

"Status Bar
Plug 'bling/vim-airline'
Plug 'https://gist.github.com/c5b864564727b40d2c0f.git',
    \ { 'as': 'bw', 'do': 'mkdir -p autoload/airline/themes; cp -f *.vim autoload/airline/themes' }

"Git Stuff
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

"Interaction Plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'

"Syntax
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mxw/vim-jsx'
" Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'leafgarland/typescript-vim'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Colors
Plug 'w0ng/vim-hybrid'

call plug#end()

"let g:deoplete#enable_at_startup = 1

" Git Stuff
"--------------------

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" linting
" --------------------
"let g:ale_linters = {}
"let g:ale_linters['javascript'] = ['eslint']
"let g:ale_linters['css'] = ['stylelint']
"let g:ale_linters['typescript'] = ['tslint', 'tsserver']

"let g:ale_fixers = {}
"let g:ale_fixers['javascript'] = ['eslint']
"let g:ale_fixers['typescript'] = ['prettier', 'tslint']

"let g:ale_fix_on_save = 1
"let g:ale_javascript_prettier_use_local_config = 1

"let g:LanguageClient_serverCommands = {
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ }

" syntax highlighting
" --------------------
syntax enable
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
let g:airline_theme='bw'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:javascript_plugin_jsdoc = 1

let g:jsx_ext_required = 0


" status bar  (airline)
" --------------------
set laststatus=2 " show status bar
set noshowmode " dont show duplicated image
set shortmess=atI " abr and disable splash screen
set showcmd " show commands

let g:airline#extensions#ale#enabled = 1

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" files
" --------------------
set hidden " show hidden files
set autoread " reload files
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


" spaces and identation
" 4 spaces
" --------------------
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
" show whitespace
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮



" other stuff
" --------------------
set iskeyword-=_ " goal: camelCase and words_like_this treated as multiple words
set incsearch " search as you type
let mapleader = ',' " because everyone does this
set scrolloff=5 " start scroll earlier
set ignorecase " Ignore case when searching...
set smartcase " ...except if we input a capital letter
set backspace=indent,eol,start " line ending movement wrap
set whichwrap=h,l,b,<,>,~,[,]
set cursorline "highlight current line
set updatetime=250 "FASTAAR!!
set splitright "split to teh right!
set inccommand=split "preview for replace


" linter isht
" --------------------
" buggy as hell. disable for now. but SeemsGood
" let g:ale_virtualtext_cursor = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
hi ALEErrorSign ctermfg=1
hi ALEWarningSign ctermfg=3


" hybrid mode
" --------------------
set number


" Mouse
" --------------------
set mouse=a


" filetypes
" --------------------
autocmd BufRead,BufNewFile *.md set filetype=markdown



" Key mappings
" --------------------

nnoremap <leader><enter> :Buffers<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>B :Buffers<CR>
nnoremap <c-p> :FZF<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>
nmap <leader>k :ALEPrevioustWrap<cr>
nmap <leader>j :ALENextWrap<cr>
nmap <leader>n :GitGutterPrevHunk<cr>
nmap <leader>m :GitGutterNextHunk<cr>
"nmap <leader>d :ALEGoToDefinition<cr>
"nmap <leader>h :ALEHover<cr>

nmap <leader>d :call LanguageClient#textDocument_definition()<CR>
nmap <leader>h :call LanguageClient#textDocument_hover()<CR>

" reload .vimrc
map <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

":W to do the same as :w
command! W  write

":sw to do :w with sudo
command! Ws execute 'silent! write !sudo tee % >/dev/null' | edit!

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

" le coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Disable arrow keys (hardcore)
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
