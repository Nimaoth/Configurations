"
imap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"
nnoremap Q q

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

" Open new tab
nnoremap <Leader>tt :tabnew<CR>

" Close new tab
nnoremap <Leader>tq :tabclose<CR>

" Next tab
nnoremap <Leader>tr :tabnext<CR>

" Prev tab
nnoremap <Leader>tn :tabprevious<CR>

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
nnoremap <Leader>gff gF
nnoremap <Leader>gfw <c-w>F
nnoremap <Leader>gft <c-w>gF

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
nnoremap <Leader>pp <C-^>

