if vim.g.snippets ~= "luasnip" then
	return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep


ls.config.set_config({
	history = true,
	updateevent = "TextChanged,TextChangedI",
	enable_autosnippets = false,
	extra_opts = {
		[types.choiceNoce] = {
			active = {
				virt_text = { { "<-", "Error" } }
			}
		}
	}
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
