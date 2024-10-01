local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local function clone_lazy_nvim()
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  return out
end

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = clone_lazy_nvim()
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

require("config.config")
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("config.plugin_dashboard"),
    require("config.plugin_onedark"),
    require("config.plugin_lualine"),
    require("config.plugin_comment"),
    require("config.plugin_neotree"),
    require("config.plugin_telescope"),
    require("config.plugin_treesitter"),
    require("config.plugin_lsp_zero"),
    require("config.plugin_wakatime"),
    require("config.plugin_pets"),
})

vim.cmd("PetsNewCustom dog black rolton");
