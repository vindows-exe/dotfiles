return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require("harpoon")
    return {
      {
        "<leader>a",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon Add File",
      },
      {
        "<leader>h",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<leader>1",
        function()
          harpoon:list():select(1)
        end,
        desc = "Harpoon to File 1",
      },
      {
        "<leader>2",
        function()
          harpoon:list():select(2)
        end,
        desc = "Harpoon to File 2",
      },
      {
        "<leader>3",
        function()
          harpoon:list():select(3)
        end,
        desc = "Harpoon to File 3",
      },
      {
        "<leader>4",
        function()
          harpoon:list():select(4)
        end,
        desc = "Harpoon to File 4",
      },
      {
        "<leader>hn",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon Next File",
      },
      {
        "<leader>hp",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon Prev File",
      },
    }
  end,
}
