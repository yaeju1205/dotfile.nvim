vim.plugin.namespace("yaeju-tools", function()
    vim.plugin.install("saecki/crates.nvim", {
        branch = "stable"
    })(function()
        require('crates').setup()
    end)
end)
