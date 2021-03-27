" terminal stuff
nmap <Leader>tu :call GotoBuffer(0)<CR>
nmap <Leader>ti :call GotoBuffer(1)<CR>
nmap <Leader>ta :call GotoBuffer(2)<CR>
nmap <Leader>te :call GotoBuffer(3)<CR>

nmap <Leader>tsu :call SetBuffer(0)<CR>
nmap <Leader>tsi :call SetBuffer(1)<CR>
nmap <Leader>tsa :call SetBuffer(2)<CR>
nmap <Leader>tse :call SetBuffer(3)<CR>

nmap <Leader>tp :call OpenTerminal("pwsh")<CR>
nmap <Leader>tw :call OpenTerminal("wsl")<CR>
nmap <Leader>tc :call OpenTerminal("cmd")<CR>
nmap <Leader>tz :call OpenTerminal("zsh")<CR>
nmap <Leader>tb :call OpenTerminal("bash")<CR>

tnoremap <CR> <CR><C-\><C-n>G
tnoremap <S-CR> <CR>
tnoremap <Esc> <C-\><C-n>

" e.g. :call OpenTerminal("pwsh")
fun! OpenTerminal(shell)
  let s_shell = &shell
  let &shell = a:shell
  terminal
  let &shell = s_shell
endfun

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
