return {
  cmd = { "pylsp" },
  filetypes = { "python", "ipynb" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git"
  },
  settings = {
    pylsp = {
      plugins = {
        mypy = {
          enabled = true,
          strict = true,
          ignore_missing_imports = true,
        }
      }
    }
  }
}

--     python_executable = "python3",
--     show_column_numbers = true,
--     show_error_codes = true,
--     strict = true,
--     ignore_missing_imports = true,
--     python_version = 3,
--   },
-- }
