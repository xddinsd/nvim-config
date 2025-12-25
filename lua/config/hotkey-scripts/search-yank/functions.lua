function yank_lines()
    local search_pattern = vim.fn.getreg('/')
    if search_pattern == '' then
        search_pattern = vim.fn.input('Pattern for yank lines: ')
        if search_pattern == '' then return end
    end

    local lines = {}
    for i = 1, vim.fn.line('$') do
        local line = vim.fn.getline(i)
        if vim.fn.match(line, search_pattern) >= 0 then
            table.insert(lines, line)
        end
    end

    if #lines > 0 then
        vim.fn.setreg('+', table.concat(lines, '\n'))
        print('Yanked ' .. #lines .. ' lines to clipboard')
    else
        print('No lines matching pattern: ' .. search_pattern)
    end
end

function yank_strings()
    local search_pattern = vim.fn.getreg('/')
    if search_pattern == '' then
        search_pattern = vim.fn.input('Pattern for yank strings: ')
        if search_pattern == '' then return end
    end

    local matches = {}
    for i = 1, vim.fn.line('$') do
        local line = vim.fn.getline(i)
        local start_idx = 1
        while true do
            local start_pos, end_pos = vim.fn.matchstrpos(line, search_pattern, start_idx - 1)
            if start_pos == -1 then break end

            local match_text = vim.fn.matchstr(line, search_pattern, start_idx - 1)
            if match_text ~= '' then
                table.insert(matches, match_text)
                start_idx = end_pos + 1
            else
                break
            end
        end
    end

    if #matches > 0 then
        vim.fn.setreg('+', table.concat(matches, '\n'))
        print('Yanked ' .. #matches .. ' matches to clipboard')
    else
        print('No matches for pattern: ' .. search_pattern)
    end
end
