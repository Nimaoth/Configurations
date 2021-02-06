set exrc " Wont open project .nvimrc without this here

call plug#begin('~/.vim/plugged')
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
    \ }

"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
" nnoremap <Leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pp :b#<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>pb :Buffers<CR>
nnoremap <Leader>pm :Marks<CR>

nnoremap <Leader>hc :let @/ = ""<CR>

" Open file under cursor
nnoremap <Leader>gff gF
nnoremap <Leader>gfw <c-w>F
nnoremap <Leader>gft <c-w>gF

" terminal stuff
nmap <Leader>tu : call GotoBuffer(0)<CR>
nmap <Leader>ti : call GotoBuffer(1)<CR>
nmap <Leader>ta : call GotoBuffer(2)<CR>
nmap <Leader>te : call GotoBuffer(3)<CR>

nmap <Leader>tsu : call SetBuffer(0)<CR>
nmap <Leader>tsi : call SetBuffer(1)<CR>
nmap <Leader>tsa : call SetBuffer(2)<CR>
nmap <Leader>tse : call SetBuffer(3)<CR>

fun! GotoBuffer(ctrlId)
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end

    let contents = g:win_ctrl_buf_list[a:ctrlId]
    if type(l:contents) != v:t_list
        echo "Nothing There"
        return
    end

    let bufh = l:contents[1]
    call nvim_win_set_buf(0, l:bufh)
endfun

let g:win_ctrl_buf_list = [0, 0, 0, 0]
fun! SetBuffer(ctrlId)
    if has_key(b:, "terminal_job_id") == 0
        echo "You must be in a terminal to execute this command"
        return
    end

    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end

    let g:win_ctrl_buf_list[a:ctrlId] = [b:terminal_job_id, nvim_win_get_buf(0)]
endfun

fun! SendTerminalCommand(ctrlId, command)
    if (a:ctrlId > 9) || (a:ctrlId < 0)
        echo "CtrlID must be between 0 - 9"
        return
    end

    if type(l:contents) != v:t_list
        echo "Nothing There"
        return
    end

    let job_id = l:contents[0]
    call chansend(job_id, command)
endfun

"
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
endfun

augroup MY_AUTO_COMMANDS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)


"fun! ExeAndPaste(command)
"    :redir @a
"    silent execute a:command
"    :redir END
"endfun

" nmap <Leader>e
