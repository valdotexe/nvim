return {
    "nvim-telescope/telescope.nvim",


    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ts", builtin.find_files, {}) -- find files in telescope
        vim.keymap.set("n", "<leader>fw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({search = word})
        end) -- find instances of the word under the cursor in all files
        vim.keymap.set("n", "<leader>git", builtin.git_files, {}) -- list files in git repo
        vim.keymap.set("n", "<leader>gf", function()
            builtin.grep_string({search = vim.fn.input("Grep: ")})
        end) -- find input
    end
}
