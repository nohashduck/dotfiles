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

vim.g.mapleader = " ";
vim.opt.clipboard = "unnamedplus";
vim.opt.shiftwidth = 4;
vim.opt.tabstop = 4;
vim.opt.smartindent = true;
vim.wo.number = true;
vim.wo.wrap = false;
vim.opt.expandtab = true;

function onedark()
	return {
		"navarasu/onedark.nvim",
		
		config = function()
			require("onedark").setup();
			require("onedark").load();
		end
	};
end

function lualine()
	return {
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
					
					lualine_x = { 
					
					},
					
					lualine_y = { 
					
					},
					
					lualine_z = {
						"filetype",
					}
				}
			});
		end
	};
end

function neotree()
	return {
		"nvim-neo-tree/neo-tree.nvim",
		
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		
		keys = {
			{ "<leader>d", "<cmd>Neotree float<cr>" }
		},
		
		config = function()
			require("neo-tree").setup({
				popup_border_style = "rounded"
			});
		end
	};
end

function wakatime()
	return {
		"wakatime/vim-wakatime",
	};
end

function treesitter()
	return {
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
	};
end

function lsp()
	return {
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
			
			vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
			
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
				}
			});

			require('mason').setup({})
			require('mason-lspconfig').setup({
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
				  		local lua_opts = lsp_zero.nvim_lua_ls()
				  		require('lspconfig').lua_ls.setup(lua_opts)
					end
			  	}
			});
		end
	};
end

require("lazy").setup({
  { onedark() },
  { neotree() },
  { wakatime() },
  { lualine() },
  { lsp() },
  { treesitter() },
});
