return {

	{
		name = "󰈔  Formatear Archivo",
		cmd = function()
			local ok, conform = pcall(require, "conform")
			if ok then
				conform.format({ lsp_fallback = true })
			else
				vim.lsp.buf.format()
			end
		end,
		rtxt = "<leader>fm",
	},

	{
		name = "󰘦  Acciones de Código",
		cmd = vim.lsp.buf.code_action,
		rtxt = "<leader>ca",
	},

	{
		name = "󰞋  Ir a definición",
		cmd = vim.lsp.buf.definition,
		rtxt = "gd",
	},

	{
		name = "󰜢  Ver Referencias",
		cmd = vim.lsp.buf.references,
		rtxt = "gr",
	},

	{
		name = "separator",
	},

	{
		name = "󰈬  Mostrar Errores",
		cmd = function()
			local ok, trouble = pcall(require, "trouble")
			if ok then
				trouble.toggle()
			else
				vim.diagnostic.open_float()
			end
		end,
		rtxt = "<leader>xx",
	},

	{
		name = "  Acciones LSP",
		hl = "Exblue",
		items = "lsp",
	},

	{
		name = "separator",
	},

	{
		name = "  Terminal flotante",
		cmd = function()
			local Terminal = require("toggleterm.terminal").Terminal
			local term = Terminal:new({
				direction = "float",
				float_opts = {
					border = "rounded",
				},
			})
			term:toggle()
		end,
		rtxt = "<leader>tt",
	},

	{
		name = "󰘳  Terminal en proyecto",
		cmd = function()
			local cwd = vim.fn.expand("%:p:h")
			local Terminal = require("toggleterm.terminal").Terminal
			local term = Terminal:new({
				cmd = vim.o.shell,
				dir = cwd,
				direction = "float",
				float_opts = {
					border = "double",
				},
			})
			term:toggle()
		end,
		rtxt = "<leader>tp",
	},

	{
		name = "separator",
	},

	{
		name = "󰈞  Buscar Archivos",
		cmd = function()
			require("telescope.builtin").find_files()
		end,
		rtxt = "<leader>ff",
	},

	{
		name = "󰊄  Buscar en Texto",
		cmd = function()
			require("telescope.builtin").live_grep()
		end,
		rtxt = "<leader>fg",
	},

	{
		name = "󱎸  Buscar Buffers",
		cmd = function()
			require("telescope.builtin").buffers()
		end,
		rtxt = "<leader>fb",
	},

	{
		name = "separator",
	},

	{
		name = "󰺕  Ver Cambios Git",
		cmd = function()
			local ok, gs = pcall(require, "gitsigns")
			if ok then
				gs.preview_hunk()
			else
				vim.cmd("Git")
			end
		end,
		rtxt = "<leader>gp",
	},

	{
		name = "󰦨  Cambios de línea",
		cmd = function()
			require("gitsigns").toggle_linehl()
		end,
		rtxt = "<leader>gl",
	},

	{
		name = "separator",
	},

	{
		name = "󰈙  Copiar Todo",
		cmd = "%y+",
		rtxt = "<C-c>",
	},

	{
		name = "󰆴  Borrar Todo",
		cmd = "%d",
		rtxt = "dc",
	},

	{
		name = "󰸱  Previsualizar Markdown",
		cmd = function()
			vim.cmd("MarkdownPreview")
		end,
		rtxt = "<leader>md",
	},

	{
		name = "󰏘  Selector de Color",
		cmd = function()
			require("minty.huefy").open()
		end,
		rtxt = "<leader>cp",
	},
}
