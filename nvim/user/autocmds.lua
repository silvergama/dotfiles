local cmd = vim.api.nvim_create_user_command

return {
  cmd('AV', function(opts)
    require('go.alternate').switch(opts.bang, 'vsplit')
    require("astronvim.utils").notify "open alternative go file in vertical split"
  end, { desc = "open alternative go file in vertical split", bang = true }),

}
