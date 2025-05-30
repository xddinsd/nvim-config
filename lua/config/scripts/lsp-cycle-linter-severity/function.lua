local current_severity_index = 1

local severities = {
	{ level = vim.diagnostic.severity.INFO, name = "INFO" },
	{ level = vim.diagnostic.severity.WARN, name = "WARN" },
	{ level = vim.diagnostic.severity.ERROR, name = "ERROR" },
}

function lsp_cycle_linter_severity()
	-- Cycle to next level
	current_severity_index = (current_severity_index % #severities) + 1
	local current_severity = severities[current_severity_index]

	-- Apply severity
	vim.diagnostic.config({
		severity_sort = true,
		float = { border = "single" },
		underline = true,
		virtual_text = {
			severity = {
				min = current_severity.level,
			},
		},
		signs = {
			severity = {
				min = current_severity.level,
			},
		},
	})

	print("Diagnostics level set to:", current_severity.name)
end
