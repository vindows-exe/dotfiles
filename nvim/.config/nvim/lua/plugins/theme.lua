return {
  { 
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_enable_bold = 1
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "gruvbox-material" } },
}
