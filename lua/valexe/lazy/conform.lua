return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formaters_by_ft = { -- add formaters here
                lua = {"stylua"}
            }
        })
    end
}
