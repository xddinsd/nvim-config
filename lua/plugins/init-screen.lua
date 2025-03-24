return {
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- Main menu header
      dashboard.section.header.val = {
        " ",
        "  ███╗   ██╗██╗ ██████╗  ██████╗ ███████╗██████╗",
        "  ████╗  ██║██║██╔════╝ ██╔════╝ ██╔════╝██╔══██╗",
        "  ██╔██╗ ██║██║██║  ███╗██║  ███╗█████╗  ██████╔╝",
        "  ██║╚██╗██║██║██║   ██║██║   ██║██╔══╝  ██╔══██╗",
        "  ██║ ╚████║██║╚██████╔╝╚██████╔╝███████╗██║  ██║",
        "  ╚═╝  ╚═══╝╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝",
        " ",
      }

      -- Main menu quick access
      dashboard.section.buttons.val = {
        dashboard.button("f",   "  Find file",       ":Telescope find_files <CR>"    ),
        dashboard.button("e",   "  New file",        ":ene <BAR> startinsert <CR>"   ),
        dashboard.button("r",   "  Recent files",    ":Telescope oldfiles <CR>"      ),
        dashboard.button("t",   "  Find text",       ":Telescope live_grep <CR>"     ),
        dashboard.button("c",   "  Config",          ":e $MYVIMRC <CR>"              ),
        dashboard.button("q",   "  Quit",            ":qa<CR>"                       ), }

      -- Main menu footer
      dashboard.section.footer.val = "Have a nice day!"

      dashboard.opts.opts.noautocmd = true -- Disable autocommands for start screen
      return dashboard.opts                                                                 end,
    config = function(_, dashboard_opts)
      require("alpha").setup(dashboard_opts) end,                                                   }, }
