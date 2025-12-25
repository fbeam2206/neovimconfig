-- plugins/telescope.lua:
return{

    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      conig = function()
        local builtin = require("telescope.builtin")
      end
    }
