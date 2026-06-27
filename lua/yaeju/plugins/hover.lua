vim.plugin.namespace("yaeju-hover", function()
    vim.plugin.install("meanderingprogrammer/render-markdown.nvim", {
        requires = {
            { origin = "nvim-treesitter/nvim-treesitter" },
            { origin = "nvim-mini/mini.nvim" }
        }
    })(function()
        require("render-markdown").setup({})
    end)
end)
