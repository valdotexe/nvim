return {
    {
        "L3MON4D3/LuaSnip",

        version = "v2.*",

        build = "make install_jsregexp",

        dependencies = {"rafamadriz/friendly-snippets"},

        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("javascript", {"jsdoc"})

            vim.keymap.set({"i", "s"}, "<C-s>n", function() ls.jump(1) end, {silent = true}) -- move to next snippet part
            vim.keymap.set({"i", "s"}, "<C-s>p", function() ls.jump(-1) end, {silent = true}) -- move back
        end
    }
}
