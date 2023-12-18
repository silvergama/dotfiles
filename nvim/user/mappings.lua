local utils = require "astronvim.utils"
local get_icon = utils.get_icon
local sections = {
  G = { desc = get_icon("go", 1, true) .. "Golang" },
}


return function(maps)
  maps.n["<leader>G"] = sections.G
  maps.n["<leader>Gf"] = { "<cmd>GoTestFunc<cr>",  desc = "Go Test Function" }

  return maps
end
