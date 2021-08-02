function RangeSearch()
    vim.fn.inputsave()

    local search_string = vim.fn.input("/")
    print(" ")
    vim.fn.inputrestore()
    if search_string:len() > 0 then
        search_string = "/" .. "\\%<" .. (vim.fn.line("'>") + 1) .. "l" .. "\\%>" .. (vim.fn.line("'<") - 1) .. "l" .. search_string
        -- print(search_string)

        vim.api.nvim_command(search_string)


    end
end

1
 2
  3
   4

-- RangeSearch()
