    "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'zig': ['zls'],
    \ 'cheez': ['cheezc', '--language-server-console', 'dummy.che'],
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
nmap <silent><Leader>lh <Plug>(lcn-hover)
nmap <silent> gr <Plug>(lcn-references)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)
noremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
noremap <silent> gw :call LanguageClient#workspace_symbol()<CR>
