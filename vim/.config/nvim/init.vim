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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

"Completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"IDE Stuffs
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"Sessions
Plug 'tpope/vim-obsession'

"Colors
" Plug 'kjssad/quantum.vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'haishanh/night-owl.vim'
" Plug 'arzg/vim-substrata'
Plug 'mcchrish/zenbones.nvim'
Plug 'rktjmp/lush.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'kristijanhusak/orgmode.nvim'

call plug#end()

" Git Stuff
"--------------------

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" syntax highlighting
" --------------------
syntax enable
set termguicolors
set background=dark
" colorscheme quantum
" colorscheme substrata
" colorscheme zenbones
colorscheme zenwritten

let g:zenwritten_darkness = 'warm'

let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" status bar  (airline)
" --------------------
set laststatus=2 " show status bar
set noshowmode " dont show duplicated image
set shortmess=atI " abr and disable splash screen
set showcmd " show commands

let g:airline_theme='tomorrow'

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'hunks']

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_z = airline#section#create(['%l:%c'])

let s:WI = [ '#E4E4E4' , '#4E4E4E' , 234 , 215 , '' ]

let g:airline#themes#peaksea#palette.normal.airline_error = g:airline#themes#peaksea#palette.normal.airline_warning

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
set list
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮

" fzf popup WIP
" --------------------
"if has('nvim')
"  let $FZF_DEFAULT_OPTS .= ' --layout=reverse'
"
"  function! FloatingFZF()
"    let height = &lines
"    let width = float2nr(&columns - (&columns * 2 / 10))
"    let col = float2nr((&columns - width) / 2)
"    let col_offset = &columns / 10
"    let opts = {
"          \ 'relative': 'editor',
"          \ 'row': 1,
"          \ 'col': col + col_offset,
"          \ 'width': width * 2 / 1,
"          \ 'height': height / 2,
"          \ 'style': 'minimal'
"          \ }
"    let buf = nvim_create_buf(v:false, v:true)
"    let win = nvim_open_win(buf, v:true, opts)
"    call setwinvar(win, '&winhl', 'NormalFloat:TabLine')
"  endfunction
"
"  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"endif


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
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" nmap <leader>k <Plug>(coc-diagnostic-prev)
" nmap <leader>j <Plug>(coc-diagnostic-next)

" nnoremap <silent> K :call <SID>show_documentation()<CR>

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" COC
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"nmap <leader>rn <Plug>(coc-rename)
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"vmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>ac  <Plug>(coc-codeaction)
"nmap <leader>qf  <Plug>(coc-fix-current)
" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Disable arrow keys (hardcore)
noremap <Up> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Left> <nop>

" BS EXPERIMENTAL STUFFS
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
"autocmd CursorHold * silent call CocActionAsync('highlight')                   " Highlight symbol under cursor on CursorHold
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected') " Setup formatexpr specified filetype(s).
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')     " Update signature help on jump placeholder
augroup end
command! -nargs=0 Format :call CocAction('format')                             " Use `:Format` for format current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)                   " Use `:Fold` for fold current buffer
autocmd FileType json syntax match Comment +\/\/.\+$+                          " COC JSON - better comment rendering

let g:netrw_fastbrowse=0
let g:netrw_liststyle=3

" WIP TERMINAL STUFFS

" Maps ESC to exit terminal's insert mode
if has('nvim')
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au FileType fzf tunmap <buffer> <Esc>
endif

" Maps ctrl-b + c to open a new tab window
nnoremap <C-b>c :tabnew +terminal<CR>
tnoremap <C-b>c <C-\><C-n>:tabnew +terminal<CR>

" Maps ctrl-b + " to open a new horizontal split with a terminal
nnoremap <C-b>" :new +terminal<CR>
tnoremap <C-b>" <C-\><C-n>:new +terminal<CR>

" Maps ctrl-b + % to open a new vertical split with a terminal
nnoremap <C-b>% :vnew +terminal<CR>
tnoremap <C-b>% <C-\><C-n>:vnew +terminal<cr>

command! T :new +terminal<CR>

augroup neovim_terminal
    autocmd!

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
augroup END



" NEW BUILT IN LSP

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end


require'lspconfig'.eslint.setup{}
EOF

autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>

" init.vim
lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_instaled = {'org'}, -- Or run :TSUpdate org
}
EOF

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
EOF


