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

let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


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

nmap <leader>k <Plug>(coc-diagnostic-prev)
nmap <leader>j <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" COC
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"nmap <leader>rn <Plug>(coc-rename)
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"vmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>ac  <Plug>(coc-codeaction)
"nmap <leader>qf  <Plug>(coc-fix-current)
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
"nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
"nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
"nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



" Disable arrow keys (hardcore)
noremap <Up> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Left> <nop>


set updatetime=300                              " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c                                " don't give |ins-completion-menu| messages.
set signcolumn=yes                              " always show signcolumns
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')                   " Highlight symbol under cursor on CursorHold
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected') " Setup formatexpr specified filetype(s).
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')     " Update signature help on jump placeholder
augroup end
command! -nargs=0 Format :call CocAction('format')                             " Use `:Format` for format current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)                   " Use `:Fold` for fold current buffer
autocmd FileType json syntax match Comment +\/\/.\+$+                          " COC JSON - better comment rendering
