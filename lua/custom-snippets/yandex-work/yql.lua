-- Luasnip
local luasnip = require("luasnip")

local snippet = luasnip.snippet

-- Luasnip nodes
local snippet_node  = luasnip.snippet_node

local text_node     = luasnip.text_node

local insert_node   = luasnip.insert_node

local function_node = luasnip.function_node

local choice_node   = luasnip.choice_node

local dynamic_node  = luasnip.dynamic_node

local restore_node  = luasnip.restore_node

-- format for defining snippets printf-like
local format = require("luasnip.extras.fmt").fmt

-- Add snippets
luasnip.add_snippets("yql", {
    snippet("odsinsert",
        format(
            [[
            INSERT INTO $dst_table WITH TRUNCATE
            SELECT
                *
            FROM
                $src_table
            ORDER BY
                *
            ]],
            {
            }                                       ) )                     } )

-- sql -> yql. Also filetype_extend func is available
luasnip.filetype_set("sql", {"yql"})


