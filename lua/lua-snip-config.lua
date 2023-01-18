local ls = require("luasnip")


-- this is where it grabs the snippets from.
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/"})

ls.config.set_config({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[require("luasnip.util.types").choiceNode] = {
			active = { virt_text = { { "● ", "GruvboxOrange" } } }
		}
	}
})
