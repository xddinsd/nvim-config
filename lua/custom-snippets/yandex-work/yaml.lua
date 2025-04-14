-- Luasnip
local luasnip = require("luasnip")

-- format for defining snippets printf-like
local format = require("luasnip.extras.fmt").fmta

-- Add snippets
luasnip.add_snippets("yaml", {
    luasnip.snippet("ts_dttm",
        format(
            "Дата и время <action> <instance> (<tz_type>)",
            {
                action   = luasnip.choice_node(
                    1,
                    {
                        luasnip.text_node("создания"),
                        luasnip.text_node("обновления")         }),

                instance = luasnip.insert_node(
                    2,
                    "записи"                             ),

                tz_type  = luasnip.choice_node(
                    3,
                    {
                        luasnip.text_node("UTC Timestamp"),
                        luasnip.text_node("MSK Datetime")       })
            }                                                           ) ),
    luasnip.snippet("pii",
        format(
            [[
            labels:
              - pii
            ]],
            {
            }                                                           ) ),

    luasnip.snippet("note",
        format(
            [[

            {% note <level> "<note_name>" %}

              <note_body>

            {% endnote %}

            ]],
            {
                level     = luasnip.choice_node(
                    1,
                    {
                        luasnip.text_node("info"),
                        luasnip.text_node("warning")            }),

                note_name = luasnip.insert_node(
                    2,
                    "Заголовок заметки"             ),
                note_body = luasnip.insert_node(
                    3,
                    "Заметка"                       )
            }                                                           ) )     } )
