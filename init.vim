set exrc " Wont open project .nvimrc without this here
set completeopt=menuone,noselect

let g:python3_host_prog = 'C:/Users/nimao/AppData/Local/Programs/Python/Python39/python3.exe'

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'simrat39/symbols-outline.nvim'


" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" languages
Plug 'ziglang/zig.vim'
Plug 'zah/nim.vim'

" Themes
Plug 'gruvbox-community/gruvbox'

" Motion
Plug 'phaazon/hop.nvim'

call plug#end()

colorscheme gruvbox

" Trim whitespace at end of lines when saving a file
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
endfun

augroup MY_AUTO_COMMANDS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Execute a vim command and put the output in the unnamed register
fun! YankCmd()
    let cmd = execute("lua print(vim.fn.input(\"y:\"))")
    let @@=execute(l:cmd)
endfun
nnoremap <Leader><Space> :call YankCmd()<CR>

let mapleader = "\<Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Plugin configuration                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require("nimaoth")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }, playground = { enable = true }}

nnoremap <leader>e :HopWord<cr>
nnoremap <leader>a :HopLine<cr>
nnoremap <leader>i :HopChar1<cr>
nnoremap <leader>u :HopChar2<cr>
