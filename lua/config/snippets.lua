
local function mergeTables(...)
  local result = {}
  for _, tbl in ipairs({...}) do
    for key, value in pairs(tbl) do
      result[key] = value           end end
  return result                             end

local keymap              = vim.keymap.set
local hotkey_default_opts = { noremap = true, silent = true }

keymap(
    'i',
    '<C-c>',
    'Дата и время создания ',
    mergeTables(
        hotkey_default_opts,
        { desc = '[Snippet] Дата и время создания '  } )   )

keymap(
    'i',
    '<C-u>',
    'Дата и время обновления ',
    mergeTables(
        hotkey_default_opts,
        { desc = '[Snippet] Дата и время обновления '  } )   )

keymap(
    'i',
    '<C-i>',
    'INSERT INTO $dst_table WITH TRUNCATE<CR>SELECT<CR><CR>FROM<CR>    $src_table',
    mergeTables(
        hotkey_default_opts,
        { desc = '[Snippet] INSERT INTO $dst_table ...'  } )   )
