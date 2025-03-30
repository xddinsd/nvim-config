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
local format = require("luasnip.extras.fmt").fmta

-- Add snippets
luasnip.add_snippets("yaml", {
    snippet("ts_dttm",
        format(
            "Дата и время <action> <instance> (<tz_type>)",
            {
                action   = choice_node(
                    1,
                    {
                        text_node("создания"),
                        text_node("обновления")         }),

                instance = insert_node(
                    2,
                    "записи"                             ),

                tz_type  = choice_node(
                    3,
                    {
                        text_node("UTC Timestamp"),
                        text_node("MSK Datetime")       })
            }                                                       ) )         } )
