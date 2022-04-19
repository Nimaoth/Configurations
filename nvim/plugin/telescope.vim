lua require("nimaoth")

nnoremap <leader>rr :lua require('nimaoth.telescope').refactors()<CR>

" Find files
nnoremap gi :lua require('telescope.builtin').git_files()<CR>
nnoremap ge :lua require('telescope.builtin').find_files()<CR>
nnoremap gu :lua require('telescope.builtin').file_browser()<CR>
nnoremap go :lua require('telescope.builtin').buffers()<CR>

nnoremap gf :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap gF :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For> ") })<CR>
nnoremap gw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>

" Other stuff
nnoremap gc :lua require('telescope.builtin').commands()<CR>
nnoremap gm :lua require('telescope.builtin').marks()<CR>
nnoremap gR :lua require('telescope.builtin').registers()<CR>
nnoremap gq :lua require('telescope.builtin').quickfix()<CR>
nnoremap gl :lua require('telescope.builtin').loclist()<CR>
nnoremap gj :lua require('telescope.builtin').jumplist()<CR>

" LSP bindings
nnoremap gs :lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap gS :lua require('telescope.builtin').lsp_workspace_symbols()<CR>
nnoremap gr :lua require('telescope.builtin').lsp_references()<CR>

nnoremap <leader>ght :lua require('telescope.builtin').help_tags()<CR>

nnoremap <leader>gd :lua require('nimaoth.telescope').search_dotfiles()<CR>

