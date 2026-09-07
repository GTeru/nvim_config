local light_theme_patterns = {
  "latte",
  "light",
  "dawn",
  "day",
  "gruvbox%-light",
}

local function detect_appearance()
  local uname = vim.loop.os_uname().sysname
  if uname == "Darwin" then
    local out = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null")
    return out:match("Dark") and "dark" or "light"
  end
  local theme_link = vim.fn.expand("~/.config/omarchy/current/theme")
  if vim.fn.isdirectory(theme_link) == 1 or vim.fn.filereadable(theme_link) == 1 then
    local target = vim.loop.fs_readlink(theme_link) or theme_link
    local name = vim.fn.fnamemodify(target, ":t"):lower()
    for _, pat in ipairs(light_theme_patterns) do
      if name:match(pat) then
        return "light"
      end
    end
    return "dark"
  end
  return "dark"
end

local function apply_appearance()
  local mode = detect_appearance()
  if vim.o.background ~= mode then
    vim.o.background = mode
  end
  pcall(vim.cmd.colorscheme, "catppuccin")
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    dependencies = {
      "LazyVim/LazyVim",
    },
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "frappe",
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      apply_appearance()
      local timer = vim.uv.new_timer()
      timer:start(3000, 3000, vim.schedule_wrap(apply_appearance))
      vim.api.nvim_create_autocmd("FocusGained", { callback = apply_appearance })
    end,
  },
}
