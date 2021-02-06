" lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

" doesn't work
" nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" doesn't work
" nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>

" grep, doesn't work
" nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

" buffer list
" nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>

" Help windows
" nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

" git
" nnoremap <leader>pg :lua require('telescope.builtin').git_files()<CR>
