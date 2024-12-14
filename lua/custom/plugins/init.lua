-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring', -- Context-aware commentstring
    },
    config = function()
      require('Comment').setup {
        pre_hook = function(ctx)
          -- Integrate with ts-context-commentstring
          return require('ts_context_commentstring.internal').calculate_commentstring {
            key = ctx.ctype == require('Comment.utils').ctype.linewise and '__default' or '__multiline',
          }
        end,
      }
    end,
  },
}
