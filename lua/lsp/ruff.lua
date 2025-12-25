return {
  cmd = { "ruff", "server" },
  filetypes = { "python", "ipynb" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    ".git"
    "setup.py",
    "setup.cfg",
    "requirements.txt",
  },
  settings = {
    args = {},
  }
}

