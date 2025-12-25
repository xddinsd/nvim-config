return {
  cmd = { "isort", "--stdout", "--filename", "${FILE}", "-" },
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
    profile = "black",
    line_length = 100,
    multi_line_output = 3,
    force_sort_within_sections = true,
    lines_after_imports = 2,
    known_first_party = {}
  },
  extra_args = {"--line-length=100"}
}
