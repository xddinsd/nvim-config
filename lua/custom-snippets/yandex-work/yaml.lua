-- Luasnip
local luasnip = require("luasnip")

-- format for defining snippets printf-like
local format = require("luasnip.extras.fmt").fmta

-- Add snippets
luasnip.add_snippets("yaml", {
	luasnip.snippet(
		"ts_dttm",
		format("Дата и время <action> <instance> (<tz_type>)", {
			action = luasnip.choice_node(1, {
				luasnip.text_node("создания"),
				luasnip.text_node("обновления"),
			}),

			instance = luasnip.insert_node(2, "записи"),

			tz_type = luasnip.choice_node(3, {
				luasnip.text_node("UTC Timestamp"),
				luasnip.text_node("MSK Datetime"),
			}),
		})
	),

	luasnip.snippet(
		"created_at",
		format(
			[[

            - name: created_at_utc_ts
              data_type: Timestamp?
              description: Дата и время создания <instance> (UTC Timestamp)

            - name: created_at_local_dttm
              data_type: Datetime?
              description: Дата и время создания <instance> (MSK Datetime)
            ]],
			{
				instance = luasnip.insert_node(1, "записи"),
			},
			{ repeat_duplicates = true }
		)
	),

	luasnip.snippet(
		"updated_at",
		format(
			[[

            - name: updated_at_utc_ts
              data_type: Timestamp?
              description: Дата и время обновления <instance> (UTC Timestamp)

            - name: updated_at_local_dttm
              data_type: Datetime?
              description: Дата и время обновления <instance> (MSK Datetime)
            ]],
			{
				instance = luasnip.insert_node(1, "записи"),
			},
			{ repeat_duplicates = true }
		)
	),

	luasnip.snippet(
		"pii",
		format(
			[[
            labels:
              - pii
            ]],
			{}
		)
	),

	luasnip.snippet(
		"note",
		format(
			[[

            {% note <level> "<note_name>" %}

              <note_body>

            {% endnote %}

            ]],
			{
				level = luasnip.choice_node(1, {
					luasnip.text_node("info"),
					luasnip.text_node("warning"),
				}),

				note_name = luasnip.insert_node(2, "Заголовок заметки"),
				note_body = luasnip.insert_node(3, "Заметка"),
			}
		)
	),
})
