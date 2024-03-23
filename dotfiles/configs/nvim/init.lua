local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

wakatime_total = " 0 mins";

local wakatime_cli_handle = io.popen("/home/$(whoami)/.wakatime/wakatime-cli --today");
wakatime_total = " " .. tostring(wakatime_cli_handle:read("*a"));
wakatime_cli_handle:close();

vim.g.mapleader = " ";
require("lazy").setup({
    {
        "navarasu/onedark.nvim",
		priority = 1000,
        config = function()
			vim.opt.clipboard = "unnamedplus";

			vim.opt.mouse = "a";
			vim.opt.mousefocus = true;

			vim.opt.shiftwidth = 4;
			vim.opt.tabstop = 4;
			vim.opt.smartindent = true;

			vim.wo.number = true;
			vim.wo.wrap = false;

			require("onedark").setup({});
			require("onedark").load();
		end
    },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				icons_enabled = true,

				options = {
					component_separators = "",
					section_separators = {
						left = "",
						right = ""
					},
				},

				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"filename",
						"branch"
					},

					lualine_c = {

					},

					lualine_x = {        cpp = function()
            local cpp_opts = lsp_zero.clangd()
            cpp_opts.cmd = { "clangd", "--config={\"compile_flags\":{\"std\":\"c++20\"}}" }
            require('lspconfig').clangd.setup(cpp_opts)
        end

					},

					lualine_y = {
						function()
							return wakatime_total;
						end,
					},

					lualine_z = {
						"filetype",
					}
				},
			});
		end
	},
	{
		"folke/which-key.nvim"
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim"
		},

		keys = {
			{ "<leader>d", "<cmd>Neotree float<cr>", desc = "NeoTree" }
		},

		config = function()
			require("neo-tree").setup();
		end
	},
	{
		"wakatime/vim-wakatime"
	},
	{
		"nvim-treesitter/nvim-treesitter",

		config = function()
			require("nvim-treesitter.configs").setup({
				syns_install = false,
				auto_install = true,

				highlight = {
					enable = true
				}
			});
		end
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},

		config = function()
			local lsp_zero = require("lsp-zero");
			
			lsp_zero.on_attach(
				function(client, bufnr)
					lsp_zero.default_keymaps({buffer = bufnr})
				end
			)
			
			local signs = {
				Error = "",
				Warn = "",
				Hint = "",
				Info = ""
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl });
			end
			
			require("cmp").setup({
				window = {
					completion = require("cmp").config.window.bordered(),
					documentation = require("cmp").config.window.bordered()
				},

				mapping = {
      				["<Tab>"] = require("cmp").mapping(require("cmp").mapping.select_next_item(), { "i", "s" }),
      				["<S-Tab>"] = require("cmp").mapping(require("cmp").mapping.select_prev_item(), { "i", "s" }),
					["<CR>"] = require("cmp").mapping.confirm({ select = true }),
				},
			});

			require('mason').setup({})
			require('mason-lspconfig').setup({
				handlers = {
					lsp_zero.default_setup,

					cpp = function()
						local cpp_opts = lsp_zero.clangd()
						cpp_opts.cmd = { "clangd", "--config={\"compile_flags\":{\"std\":\"c++20\"}}" }
						require('lspconfig').clangd.setup(cpp_opts)
					end,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end
				}
			});
		end
	},
});
