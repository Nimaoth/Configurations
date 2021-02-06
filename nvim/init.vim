set exrc " Wont open project .nvimrc without this here


call plug#begin('~/.vim/plugged')
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
"     \ }

"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'

call plug#end()

colorscheme gruvbox

let mapleader = "\<Space>"

" yank from cursor to end of line
nnoremap Y y$
nnoremap <C-a> gg"+yG
nnoremap <C-c> "+yl
vnoremap <C-c> "+y
vnoremap <C-x> "+d
nnoremap <C-v> "+p
vnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa

" undo, redo
noremap <C-z> u
noremap <C-y> <C-r>

" tent

" don't
vnoremap p "_dP

" use ctrl+e to quit insert mode
inoremap <C-e> <Esc>
vnoremap <C-e> <Esc>

" move selected line up/down
vnoremap J :m '>+4<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" use M to jump to mark
nnoremap M '

" U for redo
noremap U <C-r>

" R for replace single charactor
noremap R r

" use r for register instead of " because its more convenient
noremap r "

" ctrl+s = save
nnoremap <C-s> :w<CR>

" In insert mode, enter normal mode and find
inoremap <C-f><C-f> <Esc>/

" Open Ex on left side
nnoremap <Leader>cv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Open fuzzy finder
nnoremap <Leader>cf :Files<CR>

" Increase size of current panel
nnoremap <Leader>vs :vertical resize +10<CR>
" Decrease size of current panel
nnoremap <Leader>vd :vertical resize -10<CR>

" Move panel focus left
nnoremap <Leader>vn :wincmd h<CR>

" Move panel focus right
nnoremap <Leader>vt :wincmd l<CR>

" Move panel focus up
nnoremap <Leader>vg :wincmd k<CR>

" Move panel focus down
nnoremap <Leader>vr :wincmd j<CR>

" Close current panel
nnoremap <Leader>vq :wincmd q<CR>

" Create a vertical split
nnoremap <Leader>vv :wincmd v<CR>

" Create a horizontal split
nnoremap <Leader>vh :wincmd s<CR>

" Close all other panels except the current one
nnoremap <Leader>vf :wincmd o<CR>

" Open new tab
nnoremap <Leader>tn :tabnew<CR>

" Close new tab
nnoremap <Leader>tq :tabclose<CR>

" Add a new line below the current line
nnoremap <Leader>o o<C-[>

" Add a new line above the current line
nnoremap <Leader>O O<C-[>

" Perform a search and replace in the current line
nnoremap <Leader>hl :s/

" Perform a search and replace in the entire file
nnoremap <Leader>hf :%s/

"
nnoremap c* *Ncgn

" Perform a search and replace in the current selection
vnoremap <Leader>h :s/

tnoremap <C-e> <C-\><C-n>

" telescope
nnoremap <Leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <Leader>hc :let @/ = ""<CR>

"
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
endfun

augroup MY_AUTO_COMMANDS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

