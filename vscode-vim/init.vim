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

"
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"
nnoremap Q q

nnoremap h gh
nnoremap l gl

nnoremap <up> g<up>
nnoremap <down> g<down>

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

" ctrl+s = save
nnoremap <C-s> :w<CR>

" In insert mode, enter normal mode and find
inoremap <C-f><C-f> <Esc>/

" Open Ex on left side
nnoremap <Leader>cv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Open fuzzy finder
nnoremap <Leader>cf :Files<CR>

" Increase size of current panel
" nnoremap <Leader>vs :vertical resize +10<CR>
" Decrease size of current panel
" nnoremap <Leader>vd :vertical resize -10<CR>

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

" Move panel focus left
nnoremap ti :wincmd h<CR>

" Move panel focus right
nnoremap te :wincmd l<CR>

" Move panel focus up
nnoremap tl :wincmd k<CR>

" Move panel focus down
nnoremap ta :wincmd j<CR>

" Close current panel
nnoremap tw :wincmd q<CR>

" Create a vertical split
nnoremap tv :wincmd v<CR>

" Create a horizontal split
nnoremap tc :wincmd s<CR>

" Close all other panels except the current one
nnoremap tf :wincmd o<CR>

" Open new tab
nnoremap tt :tabnew<CR>

" Close new tab
nnoremap tq :tabclose<CR>

" Next tab
nnoremap tr :tabnext<CR>

" Prev tab
nnoremap tn :tabprevious<CR>

" Add a new line below the current line
nnoremap <Leader>o o<C-[>

" Add a new line above the current line
nnoremap <Leader>O O<C-[>

" Perform a search and replace in the current line
nnoremap <Leader>hl :s/

" Perform a search and replace in the entire file
nnoremap <Leader>hf :%s/

" Clear seach highlight
nnoremap <Leader>hc :let @/ = ""<CR>

" Open file under cursor
nnoremap gv <c-w>vgf
nnoremap gV <c-w>vgF
nnoremap gh <c-w>f
nnoremap gH <c-w>F

"
nnoremap c* *Ncgn

" Perform a search and replace in the current selection
vnoremap <Leader>h :s/

tnoremap <C-e> <C-\><C-n>
tnoremap <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" in insert mode, press C-r to temporarily enter normal mode
inoremap <A-o> <C-o>

" visual block
nnoremap <Leader>vb <C-v>

" switch to alternate Buffer
nnoremap ga <C-^>

" comment in selection
nnoremap <Leader>kc :'<,'>g/./:exe "norm I//"<cr><Space>hc
" comment out selection
nnoremap <Leader>ku :'<,'>g/\/\//:norm 0xx<cr>


lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }, playground = { enable = true }}

nnoremap <leader>e :HopWord<cr>
nnoremap <leader>a :HopLine<cr>
nnoremap <leader>i :HopChar1<cr>
nnoremap <leader>u :HopChar2<cr>
