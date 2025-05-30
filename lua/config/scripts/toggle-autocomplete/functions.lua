local autocomplete_enabled = false

local function toggle_autocomplete_local()
	autocomplete_enabled = not autocomplete_enabled
	local new_autocomplete = autocomplete_enabled and { require("cmp.types").cmp.TriggerEvent.TextChanged } or {}
	require("cmp").setup({
		completion = { autocomplete = new_autocomplete },
	})
end

function toggle_autocomplete()
	local cmp = require("cmp")
	toggle_autocomplete_local()
	if cmp.visible() then
		cmp.close()
	else
		cmp.complete()
	end
end
