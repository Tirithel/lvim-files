local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.builtin.which_key.mappings['H'] = {
  name = "Harpoon",

  U = { ui.toggle_quick_menu, "Toggle UI" },
  a = { mark.add_file, "Add File" },

  ["1"] = {function() ui.nav_file(1) end, "File 1" },
  ["2"] = {function() ui.nav_file(2) end, "File 2" },
  ["3"] = {function() ui.nav_file(3) end, "File 3" },
  ["4"] = {function() ui.nav_file(4) end, "File 4" },
}
