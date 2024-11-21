-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local npairs = require 'nvim-autopairs'
    npairs.setup {
      map_c_h = true,
    }
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    -- Map C-j to behave like Enter in insert mode
    vim.api.nvim_set_keymap('i', '<C-j>', 'v:lua.MPairsCR()', { expr = true, noremap = true })

    -- Define the function to handle the autopairs Enter behavior
    _G.MPairsCR = function()
      if vim.fn.pumvisible() ~= 0 then
        return npairs.esc '<C-e>' -- Close completion menu
      else
        return npairs.check_break_line_char() -- Autopairs' handling of <CR>
      end
    end
  end,
}
