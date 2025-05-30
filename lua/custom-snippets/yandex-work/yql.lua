-- Luasnip
local luasnip = require("luasnip")

-- format for defining snippets printf-like
local format = require("luasnip.extras.fmt").fmta

-- Add snippets
luasnip.add_snippets("yql", {
	luasnip.snippet(
		"odsinsert",
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
			{}
		)
	),

	luasnip.snippet(
		"sel",
		format("<select_field>", {
			select_field = luasnip.choice_node(1, {
				format("$to_str(<field_name>) AS <field_name>,", {
					field_name = luasnip.insert_node(1, "utf8_id"),
				}, { repeat_duplicates = true }),
				format("<field_name> AS <field_name>,", {
					field_name = luasnip.insert_node(1, "created_at"),
				}, { repeat_duplicates = true }),
			}),
		})
	),

	luasnip.snippet(
		"odslibs",
		format(
			[[

            PRAGMA Library("helpers.sql" );
            PRAGMA Library("datetime.sql");


            IMPORT `helpers`    SYMBOLS $to_str;

            IMPORT `datetime`   SYMBOLS $from_utc_ts_to_msk_dt;

            ]],
			{}
		)
	),
})

-- sql -> yql. Also filetype_extend func is available
luasnip.filetype_set("sql", { "yql" })
