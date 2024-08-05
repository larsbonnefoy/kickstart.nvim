return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = '[a]dd' })
      vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[m]enu' })

      vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = 'First element' })
      vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = 'Second element'})
      vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = 'Third element'})
      vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = 'Fourth element'})

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, {desc = '[p]revious element in harpoon list'})
      vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, {desc = '[n]ext element in harpoon list'})
      harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
    end,
  },
}
