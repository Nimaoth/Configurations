set exrc " Wont open project .nvimrc without this here

call plug#begin('~/.vim/plugged')
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" languages
Plug 'ziglang/zig.vim'

if has('win32')
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
        \ }
else
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
endif

" autocompletion
Plug 'Shougo/echodoc.vim'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tommcdo/vim-lion'
Plug 'Nimaoth/winresizer'
Plug 'simnalamburt/vim-mundo'

call plug#end()

colorscheme gruvbox

"
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

" Deoplete
let g:deoplete#enable_at_startup = 1

" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
