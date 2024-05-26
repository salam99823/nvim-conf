require("utils.aliases")
require("utils.binders")

Im("jk", "<esc>")
Nm("<leader>v", "<cmd>Neotree filesystem left toggle dir=./<cr>")
Nm("<leader><Tab>", "<cmd>Neotree buffers left toggle dir=./<cr>")
Nm("<leader>bn", "<cmd>bn<cr>")
Nm("<leader>bp", "<cmd>bp<cr>")
Nm("<leader>t", "<cmd>TroubleToggle document_diagnostics<cr>")
Nm("<leader>1", "<cmd>LualineBuffersJump 1<cr>")
Nm("<leader>2", "<cmd>LualineBuffersJump 2<cr>")
Nm("<leader>3", "<cmd>LualineBuffersJump 3<cr>")
Nm("<leader>4", "<cmd>LualineBuffersJump 4<cr>")
Nm("<leader>5", "<cmd>LualineBuffersJump 5<cr>")
Nm("<leader>6", "<cmd>LualineBuffersJump 6<cr>")



Api.nvim_create_user_command("TryLint", function(args)
	require("lint").try_lint(args.fargs[0])
end, {
	nargs = 1,
	complete = function(_, _, _)
		local filetype = Api.nvim_buf_get_option(0, "filetype")
		return require("lint").linters_by_ft[filetype]
	end,
	desc = "",
})